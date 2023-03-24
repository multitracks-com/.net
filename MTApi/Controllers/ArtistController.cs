using Microsoft.AspNetCore.Mvc;
using MTBusiness.Business.Interfaces;
using MTDTOs.DTOs;

namespace MTApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ArtistController : ControllerBase
    {
        private readonly IArtistBusiness _artistBusiness;
        private readonly ILogger<ArtistController> _logger;

        public ArtistController(IArtistBusiness artistBusiness, ILogger<ArtistController> logger)
        {
            _artistBusiness = artistBusiness;
            _logger = logger;
        }

        [HttpPost]
        [Route("add")]
        public ActionResult<List<ArtistDTO>> AddArtist(ArtistRequestDTO artist)
        {
            _logger.LogInformation("Full request: " , artist);

            var isValid = artist != null ? VerifyArtistRequest(artist) : false;

            if (!isValid)
                return BadRequest("No artist field can be null or empty");

            var artistResult = _artistBusiness.AddArtist(artist);

            return Ok(artistResult);
        }


        [HttpGet]
        [Route("search/{artistName}")]
        public ActionResult<List<ArtistDTO>> SearchArtist(
            [FromRoute] string artistName,
            [FromQuery] PagedParams pagedParams)
        {
            _logger.LogInformation("Artist name:"+artistName, pagedParams);

            if (string.IsNullOrEmpty(artistName))
                return BadRequest("Artist name cant be null or empty");

            var artistResult = _artistBusiness.GetArtistsByArtistName(artistName)
                                              .OrderBy(artist => artist.Name)
                                              .Skip((pagedParams.Page - 1) * pagedParams.ItemsPerPage)
                                              .Take(pagedParams.ItemsPerPage);

            return Ok(artistResult);
        }

        private bool VerifyArtistRequest (ArtistRequestDTO artist)
        {
            if (string.IsNullOrEmpty(artist.ImageUrl) || string.IsNullOrEmpty(artist.Name) || string.IsNullOrEmpty(artist.HeroImageUrl) || string.IsNullOrEmpty(artist.Biography))
                return false;
            return true;
        }
    }
}
