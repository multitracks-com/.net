using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Dapper.Models_Dapper
{
    public class pagedSongs_Dap
    {
        public int TotalRecords { get; set; }
        public int CurrentPageNumber { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
        public List<song_Dap> song_Daps { get; set; }
        public pagedSongs_Dap(List<song_Dap> _song_Daps, int totalRecords, int currentPageNumber, int pageSize)
        {
            song_Daps = _song_Daps;
            TotalRecords = totalRecords;
            CurrentPageNumber = currentPageNumber;
            PageSize = pageSize;

            TotalPages = Convert.ToInt32(Math.Ceiling(TotalRecords / (double)pageSize));
        }
    }
}
