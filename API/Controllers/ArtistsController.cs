using API.Models;
using Newtonsoft.Json;
using System.Web.Http;

namespace API.Controllers
{

    public class ArtistsController : ApiController
    {
        private Artist a = new Artist();
        // GET: api/Artists/Crowder
        public string GetArtist(string name)
        {
            string output = "";
            Artist artist = a.GetArtistAPI(name);
            output += JsonConvert.SerializeObject(artist, Formatting.Indented);
            return output;
        }

    }
}
