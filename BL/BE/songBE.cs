using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BL.DTO;
using DAL.Models;
using DAL_EF.Models;

namespace BL.BE
{
    public class songBE
    {
        public pagedSongsDTO getSongs(int pageSize, int currentPageNumber)
        {
            DAL_EF.TE.songTE songTE = new DAL_EF.TE.songTE();

            DAL_EF.Models.pagedSongs _songs = songTE.GetSongs(pageSize, currentPageNumber);

            pagedSongsDTO paged = new pagedSongsDTO(_songs);

            return paged;
        }
    }
}
