using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web_Api__multitracks.Data;
using Web_Api__multitracks.Models;

namespace Web_Api__multitracks.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class artistController : ControllerBase
    {
        private readonly MultiTracksDBContext _context;
        public artistController(MultiTracksDBContext context)
        {
            _context = context;
        }
        [Route("search")]
        [HttpGet]
        public async Task<ActionResult<string>> ArtistName(string artistTitle)
        {
            var res = await (from a in _context.Artist
                             where a.title.Contains(artistTitle)

                             select a.title
                             ).ToListAsync();
                         
                            // ).FirstOrDefaultAsync();
            return Ok(res);
        }

        [HttpPost]
        [Route("add")]
        public async Task<ActionResult<Artist>> AddArtist(Artist artist)
        {
            _context.Artist.Add(artist);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(ArtistName), new { ar = artist.title }, artist);
        }
    }
}
