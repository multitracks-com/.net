using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace models
{
    public class album
    {
        public int albumID { get; set; }
        public string albumTitle { get; set; }
        public string albumImage { get; set; }
        public int year { get; set; }
        public int albumSongID { get; set; }
        public List<song> songs { get; set; }
    }
}
