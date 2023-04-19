using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Dapper.Models_Dapper;
using BL_Dap.DTO_Dap;
using DAL_Dapper.TE_Dapper;

namespace BL_Dap.BE_Dap
{
    public class songBE
    {
        public pagedSongsDTO_Dap GetSongs(int currentPageNumber, int pageSize)
        {
            songTE_Dap songTE_Dap = new songTE_Dap();

            pagedSongs_Dap pagingResponse_Dap = songTE_Dap.GetSongs(currentPageNumber, pageSize);

            pagedSongsDTO_Dap paggingResponsaDTO_Dap = new pagedSongsDTO_Dap(pagingResponse_Dap);

            return paggingResponsaDTO_Dap;
        }
    }
}
