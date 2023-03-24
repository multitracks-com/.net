using Microsoft.AspNetCore.Mvc;
using MTBusiness.Business.Interfaces;
using MTDTOs.DTOs;

namespace MTApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SongController : Controller
    {
        private readonly ISongBusiness _songBusiness;
        private readonly ILogger<ArtistController> _logger;

        public SongController(ISongBusiness songBusiness, ILogger<ArtistController> logger)
        {
            _songBusiness = songBusiness;
            _logger = logger;
        }

        [HttpGet]
        [Route("list")]
        public ActionResult<List<SongDTO>> SearchArtist(
            [FromQuery] PagedParams pagedParams)
        {
            _logger.LogInformation("", pagedParams);

            var artistResult = _songBusiness.GetAll()
                                              .OrderBy(song => song.SongId)
                                              .Skip((pagedParams.Page - 1) * pagedParams.ItemsPerPage)
                                              .Take(pagedParams.ItemsPerPage);

            return Ok(artistResult);
        }
    }
}
