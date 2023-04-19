using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Azure;
using DAL.Models;
using Microsoft.EntityFrameworkCore;

namespace DAL_EF.TE
{
    public class songTE
    {
        public Models.pagedSongs GetSongs(int pageSize , int currentPageNumber)
        {
            Models.pagedSongs res = new Models.pagedSongs();

            using (var context = new MultiTracksContext()) {
                List<Song> songList = context.Songs.ToList();

                if (songList == null)
                {
                    Models.pagedSongs Data = new Models.pagedSongs();
                    return Data;
                }

                int maxPagSize = 50;
                pageSize = (pageSize > 0 && pageSize <= maxPagSize) ? pageSize : maxPagSize;

                int skip = (currentPageNumber - 1) * pageSize;

                decimal totalRecords = songList.Count();
                int totalPages = Convert.ToInt32(Math.Ceiling(totalRecords / pageSize));

                IEnumerable<Song> songs = songList.Skip(skip).Take(pageSize).ToList();

                foreach (Song song in songs)
                {
                    context.Entry(song).Reference(s => s.TimeSignatureNavigation).Load();
                }

                res.totalRecords = totalRecords;
                res.totalPages = totalPages;
                res.pageSize = pageSize;
                res.currentPage = currentPageNumber;
                res.songs = songs;

            }

            return res;
        }
    }
}
