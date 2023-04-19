using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_EF.Models;
using DAL_EF.TE;

namespace BL.DTO
{
    public class pagedSongsDTO
    {
        public decimal totalRecords { get; set; }
        public int totalPages { get; set; }
        public int pageSize { get; set; }
        public int currentPage { get; set; }
        public IEnumerable<SongDTO> songs { get; set; }

        public pagedSongsDTO(pagedSongs pagedSongs)
        {
            List<SongDTO> songList = new List<SongDTO>();


            foreach (var song in pagedSongs.songs)
            {
                SongDTO songDTO = new SongDTO(song);

                songList.Add(songDTO);
            };

            totalRecords = pagedSongs.totalRecords;
            totalPages = pagedSongs.totalPages;
            pageSize = pagedSongs.pageSize;
            currentPage = pagedSongs.currentPage;
            songs = songList;

        }
    }
}
