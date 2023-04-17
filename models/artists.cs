using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace models
{
    public class artist
    {
        public int artistID;
        public string artistTitle { get; set; }
        public string biography { get; set; }
        public string artistImage { get; set; }
        public string heroURL { get; set; }
        public List<album> albums { get; set; }
    }

}
