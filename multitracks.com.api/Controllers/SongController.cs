using multitracks.com.api.Repository.Interface;
using System.Web.Http;

namespace multitracks.com.api.Controllers
{
    [RoutePrefix("song")]
    public class SongController : ApiController
    {
        private readonly ISongRepository _songRepository;

        public SongController(ISongRepository songRepository)
        {
            _songRepository = songRepository;
        }

        [Route("list"), HttpGet]
        public IHttpActionResult ListSongs([FromUri] int pageSize, [FromUri] int pageNumber)
        {
            var result = _songRepository.GetListOfSongs(pageSize, pageNumber);

            return Json(result);
        }
    }
}