using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Dapper.Models_Dapper;

namespace BL_Dap.DTO_Dap
{
    public class pagedSongsDTO_Dap
    {
        public int TotalRecords { get; set; }
        public int CurrentPageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
        public List<songDTO_Dap> songDTO_Daps { get; set; }

        public pagedSongsDTO_Dap(DAL_Dapper.Models_Dapper.pagedSongs_Dap paggingResponse)
        {
            TotalRecords = paggingResponse.TotalRecords;
            CurrentPageNumber = paggingResponse.CurrentPageNumber;
            PageSize = paggingResponse.PageSize;
            TotalPages = paggingResponse.TotalPages;

            List<songDTO_Dap> songDTO_DapList = new List<songDTO_Dap>();

            foreach(song_Dap song_Dap in paggingResponse.song_Daps)
            {
                songDTO_Dap songDTO_Dap = new songDTO_Dap(song_Dap);

                songDTO_DapList.Add(songDTO_Dap);
            }

            songDTO_Daps = songDTO_DapList;

        }
    }
}
