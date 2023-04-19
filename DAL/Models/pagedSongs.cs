using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_EF.Models
{
    public class pagedSongs
    {
        public decimal totalRecords { get; set; }
        public int totalPages { get; set; }
        public int pageSize { get; set; }
        public int currentPage { get; set; }
        public IEnumerable<Song> songs { get; set; }
    }
}
