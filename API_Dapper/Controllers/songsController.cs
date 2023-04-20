using BL_Dap.BE_Dap;
using BL_Dap.DTO_Dap;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Dapper.Controllers
{
    [ApiController]
    public class songsController : ControllerBase
    {
        [HttpGet("song/list")]
        public IActionResult GetSongs(int currentPageNumber, int pageSize)
        {
            try
            {
                songBE songBE = new songBE();

                pagedSongsDTO_Dap paggingResponsaDTO_Dap = songBE.GetSongs(currentPageNumber, pageSize);

                return Ok(paggingResponsaDTO_Dap);
            }
            catch (Exception ex)
            {
                throw new Exception("Unexpected error " + ex.Message);
            }
        }
    }
}
