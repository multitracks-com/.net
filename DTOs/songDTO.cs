using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using models;

namespace DTOs
{
    public class songDTO
    {
        public song song { get; set; }
        public string albumTitle { get; set; }
        public string albumImage { get; set; }
    }
}
