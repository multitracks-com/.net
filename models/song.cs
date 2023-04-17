using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace models
{
    public class song
    {
        public int songID { get; set; }
        public string songTitle { get; set; }
        public string bpm { get; set; }
        public string timeSignature { get; set; }
        public int albumSongID { get; set; }

    }
}
