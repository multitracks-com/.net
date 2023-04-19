using API.Models;
using Newtonsoft.Json;
using System.Web.Http;
using System.Xml.Linq;

namespace API.Controllers
{
    //Use the addArtist page as the means to send data to POST method. Search can be done through URL like a traditional API Controller.
    //Reason for all the different types of APIs is to showcase the ability to utilize different methodologies
    public class ArtistsController : ApiController
    {
        private Artist a = new Artist();
        //GET: api/Artists
        [HttpGet]
        [Route("api/Artists/")]
        public string Get()
        {           
            return "api/Artists/{query} to search artist by name";
        }
        //GET: api/Artists/Crowder
        [HttpGet]
        [Route("api/Artists/search/{name}")]
        public string Get(string name)
        {
            string output = "";
            Artist artist = a.GetArtistAPI(name);
            if(artist!= null)
            {
                output += JsonConvert.SerializeObject(artist, Formatting.Indented);
                return output;
            }
            return "Artist Not Found!";
        }
        [HttpPost]
        [Route("api/Artists/add")]
        public string Post(Artist artist)
        {
            //deserialize and post to db
            string resp = a.PostArtist(artist);
            return resp;

        }
    }
}
