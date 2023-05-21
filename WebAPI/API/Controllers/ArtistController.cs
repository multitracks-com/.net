using API.Models;
using DataAccess;
using Serilog;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Http;

namespace API.Controllers
{
    public partial class ArtistController : ApiController
    {
        /// <summary>
        /// this API can be accessed using this -"api.multitracks.com/artist/search?name={name}"
        /// replace {name} with title.
        /// </summary>
        /// <param name="name"></param>
        /// <returns>IHttpActionResult</returns>
        [HttpGet]
        [Route("api.multitracks.com/artist/search")]
        public IHttpActionResult Search(string name)
        {
            Artist artist = new Artist();
            List<Artist> artists = artist.GetArtists();
            try
            {
                if (string.IsNullOrWhiteSpace(name))
                {
                    return BadRequest("The name parameter is required.");
                }

                var matchedArtists = artists.Where(a => a.title.ToLower().Contains(name.ToLower())).ToList();

                if (matchedArtists.Count == 0)
                {
                    return NotFound();
                }

                return Ok(matchedArtists);
            }
            catch (Exception ex)
            {
                Log.Error(ex, "An exception occurred while searching for an artist.");
                return InternalServerError(ex);
            }
        }
        /// <summary>
        /// this Post Method is used to add the new Artist to the Artist Table
        /// </summary>
        /// <param name="artist"></param>
        /// <returns>IHttpActionResult</returns>
        [HttpPost]
        [Route("api.multitracks.com/artist/add")]
        public IHttpActionResult AddArtist(Artist artist)
        {
            try
            {
                Artist newArtist = new Artist();
                if (artist == null)
                {
                    return BadRequest("Invalid artist data. Artist data cannot be null.");
                }
                int id = newArtist.SetArtist(artist);
                return Ok("Artist Added Succesfully");
            }
            catch (Exception ex)
            {
                Log.Error(ex,"The Artist you are trying to add is Invalid");
                return InternalServerError(ex);
            }
        }
    }
}