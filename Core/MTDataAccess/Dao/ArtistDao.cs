using DataAccess;
using Microsoft.Extensions.Configuration;
using MTDataAccess.Dao.Interfaces;
using MTDataAccess.Domain;
using MTDataAccess.Extensions;
using System.Collections.Generic;
using System.Linq;

namespace MTDataAccess.Dao
{
    public class ArtistDao : IArtistDao
    {
        private readonly IConfiguration _configuration;

        public ArtistDao(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public Artist AddArtist(Artist artist)
        {
            var result = new List<Artist>();
            var sql = new SQL(_configuration.GetConnectionString(DAConstants.ConnectionName));

            sql.Parameters.Add("@ArtistName", artist.Name);
            sql.Parameters.Add("@ArtistBiography", artist.Biography);
            sql.Parameters.Add("@ArtistImageUrl", artist.ImageUrl);
            sql.Parameters.Add("@ArtistHeroImageUrl", artist.HeroImageUrl);

            sql.OpenConnection();
            sql.BeginTransaction();

            var artistTable = sql.ExecuteStoredProcedureDT("AddArtist");

            sql.Commit();
            sql.CloseConnection();

            if (artistTable.Rows?.Count < 1)
                return new Artist();

            return artistTable.TranslateToArtistDomain().FirstOrDefault();
        }

        public List<Artist> GetArtistsByArtistName(string artistName)
        {
            var result = new List<Artist>();
            var sql = new SQL(_configuration.GetConnectionString(DAConstants.ConnectionName));

            sql.Parameters.Add("@ArtistName", artistName);

            sql.OpenConnection();
            sql.BeginTransaction();

            var artistTable = sql.ExecuteStoredProcedureDT("GetArtistByArtistName");

            sql.Commit();
            sql.CloseConnection();

            if (artistTable.Rows?.Count < 1)
                return result;
            
            return artistTable.TranslateToArtistDomain();
        }

    }
}
