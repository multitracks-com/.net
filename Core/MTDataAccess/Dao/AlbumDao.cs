using DataAccess;
using Microsoft.Extensions.Configuration;
using MTDataAccess.Dao.Interfaces;
using MTDataAccess.Domain;
using MTDataAccess.Extensions;
using System.Collections.Generic;

namespace MTDataAccess.Dao
{
    public class AlbumDao : IAlbumDao
    {
        private readonly IConfiguration _configuration;

        public AlbumDao(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public List<Album> GetAlbumByArtistId(int artistId)
        {
            var result = new List<Album>();
            var sql = new SQL(_configuration.GetConnectionString(DAConstants.ConnectionName));

            sql.Parameters.Add("@ArtistId", artistId);

            sql.OpenConnection();
            sql.BeginTransaction();

            var albumTable = sql.ExecuteStoredProcedureDT("GetAlbumsByArtistId");
            
            sql.Commit();
            sql.CloseConnection();

            if (albumTable.Rows?.Count < 1)
                return result;

            return albumTable.TranslateToAlbumDomain();
        }
    }
}
