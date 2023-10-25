using multitracks.com.api.Models.Dtos;
using multitracks.com.api.Repository.Interface;
using System.Web.Http;

namespace multitracks.com.api.Controllers
{
	[RoutePrefix("artist")]
	public class ArtistController : ApiController
	{
		private readonly IArtistRepository _artistRepository;

		public ArtistController(IArtistRepository artistRepository)
		{
			_artistRepository = artistRepository;
		}

		[Route("search"), HttpGet]
		public IHttpActionResult SearchArtist([FromUri] string name)
		{
			var result = _artistRepository.SearchArtists(name);
			return Json(result);
		}

		[Route("add"), HttpPost]
		public IHttpActionResult AddArtist([FromBody] AddArtistDto artist)
		{
			var result = _artistRepository.AddArtist(artist);
			if (result == 1) return Ok("Success");
			return BadRequest();
		}
	}
}