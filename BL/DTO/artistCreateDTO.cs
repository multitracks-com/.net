using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.DTO
{
    public class artistCreateDTO
    {
        public string Title { get; set; } = null!;

        public string Biography { get; set; } = null!;

        public string ImageUrl { get; set; } = null!;

        public string HeroUrl { get; set; } = null!;
    }
}
