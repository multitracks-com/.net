using Dapper;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using modelsDapper;
using System.Collections.Generic;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Dapper.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArtistController : ControllerBase
    {

        private string connection = "Data Source=localhost\\SQLExpress;Initial Catalog=MultiTracks;Integrated Security=True;";
        // GET: api/<ArtistController>
        [HttpGet]
        public IActionResult Get()
        {

            IEnumerable<artist> lst = null;

                using (var db = new SqlConnection(connection))
                {
                    var sql = "SELECT artistID, title, biography, imageURL, heroURL FROM artist";

                    lst = db.Query<artist>(sql);
                }

            return Ok(lst);
        }

        // GET api/<ArtistController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<ArtistController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ArtistController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ArtistController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
