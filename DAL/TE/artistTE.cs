using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_EF.Models;
using Microsoft.EntityFrameworkCore;

namespace DAL_EF.TE
{
    public class artistTE
    {
        public IEnumerable<Artist> GetArtistByName(string name)
        {
            List<Artist> artist = new List<Artist>();

            using (var context = new MultiTracksContext())
            {
                string trimmedName = name.Trim();
                artist = context.Artists.Where(a => a.Title.Contains(trimmedName)).ToList();
            }

            return artist;
        }

        public bool CreateArtist(Artist artist)
        {
            int rowsAffected = 0;

            using (var context = new MultiTracksContext())
            {
                artist.DateCreation = DateTime.Now;

                context.Artists.Add(artist);

                rowsAffected = context.SaveChanges();
            }

            return rowsAffected > 0 ? true : false;
        }
    }

    
}
