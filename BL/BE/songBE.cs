using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BL.DTO;
using DAL_EF.Models;
using DAL_EF.TE;

namespace BL.BE
{
    public class songBE
    {
        public pagedSongsDTO getSongs(int pageSize, int currentPageNumber)
        {
            songTE songTE = new songTE();

            pagedSongs _songs = songTE.GetSongs(pageSize, currentPageNumber);

            pagedSongsDTO paged = new pagedSongsDTO(_songs);

            return paged;
        }
    }
}
