using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Azure;
using DAL_EF.Models;
using Microsoft.EntityFrameworkCore;

namespace DAL_EF.TE
{
    public class songTE
    {
        public pagedSongs GetSongs(int pageSize , int currentPageNumber)
        {
            pagedSongs res = new pagedSongs();

            using (var context = new MultiTracksContext()) {
                List<Song> songList = context.Songs.ToList();

                if (songList == null)
                {
                    pagedSongs Data = new pagedSongs();
                    return Data;
                }

                currentPageNumber = currentPageNumber == 0 ? 1 : currentPageNumber;
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
