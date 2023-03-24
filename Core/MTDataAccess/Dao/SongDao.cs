using DataAccess;
using Microsoft.Extensions.Configuration;
using MTDataAccess.Dao.Interfaces;
using MTDataAccess.Domain;
using MTDataAccess.Extensions;
using System.Collections.Generic;

namespace MTDataAccess.Dao
{
    public class SongDao : ISongDao
    {
        private readonly IConfiguration _configuration;

        public SongDao(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public List<Song> GetAll()
        {
            var result = new List<Song>();
            var sql = new SQL(_configuration.GetConnectionString(DAConstants.ConnectionName));

            sql.OpenConnection();
            sql.BeginTransaction();

            var songTable = sql.ExecuteStoredProcedureDT("GetAllSongs");

            sql.Commit();
            sql.CloseConnection();

            if (songTable.Rows?.Count < 1)
                return result;

            return songTable.TranslateToSongDomain();
        }

        public List<Song> GetSongByAlbumId(int albumId)
        {
            var result = new List<Song>();
            var sql = new SQL(_configuration.GetConnectionString(DAConstants.ConnectionName));

            sql.Parameters.Add("@AlbumId", albumId);

            sql.OpenConnection();
            sql.BeginTransaction();

            var songTable = sql.ExecuteStoredProcedureDT("GetSongsByAlbumId");

            sql.Commit();
            sql.CloseConnection();

            if (songTable.Rows?.Count < 1)
                return result;

            return songTable.TranslateToSongDomain();
        }
    }
}
