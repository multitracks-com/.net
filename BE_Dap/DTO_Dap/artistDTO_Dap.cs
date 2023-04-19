using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL_Dap.DTO_Dap
{
    public class artistDTO_Dap
    {
        public int artistID;
        public string title { get; set; }
        public string biography { get; set; }
        public string imageURL { get; set; }
        public string heroURL { get; set; }

        public artistDTO_Dap(DAL_Dapper.Models_Dapper.artist_Dap artist_Dap)
        { 
            artistID = artist_Dap.artistID;
            title = artist_Dap.title;
            biography = artist_Dap.biography;
            imageURL = artist_Dap.imageURL;
            heroURL = artist_Dap.heroURL;
        }
    }
}
