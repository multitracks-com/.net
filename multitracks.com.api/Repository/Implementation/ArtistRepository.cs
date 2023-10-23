using DataAccess;
using multitracks.com.api.Models.Dtos;
using multitracks.com.api.Repository.Interface;
using System;
using System.Data;
using System.Data.SqlClient;

namespace multitracks.com.api.Repository
{
    public class ArtistRepository : IArtistRepository
    {
        private readonly string _addArtistQuery =
            "INSERT INTO [dbo].[Artist] (dateCreation, title, biography, imageUrl, heroUrl)VALUES ('{0}','{1}','{2}','{3}','{4}')";

        public ArtistDto SearchArtist(string name)
        {
            try
            {
                return FetchArtistData(name);
            }
            catch (Exception ex)
            {
                // Log error
                throw new Exception("An error occurred while searching for the artist.", ex);
            }
        }

        private ArtistDto FetchArtistData(string name)
        {
            var sql = new SQL();
            var artist = new ArtistDto();
            var sqlParameter = new SqlParameter("@artistName", SqlDbType.NVarChar);
            sqlParameter.Value = name;
            sql.Parameters.Add(sqlParameter);
            var dataTable = sql.ExecuteStoredProcedureDT("GetArtistDetailsByName");
            if (dataTable == null || dataTable.Rows.Count == 0)
            {
                return null;
            }

            var dataRow = dataTable.FirstOrNewRow();
            artist = MapArtistDetails(dataRow, artist);
            return artist;
        }

        public int AddArtist(ArtistDto artist)
        {
            try
            {
                return AddArtistToDb(artist);
            }
            catch (Exception ex)
            {
                //log error
                throw new Exception("An error occurred while adding the artist.", ex);
            }
        }

        private ArtistDto MapArtistDetails(DataRow dataRow, ArtistDto artist)
        {
            if (dataRow == null || artist == null) return new ArtistDto();
            if (dataRow["ArtistId"] != null)
            {
                artist.ArtistId = Convert.ToString(dataRow["ArtistId"]);
            }

            if (dataRow["ArtistTitle"] != null)
            {
                artist.Title = Convert.ToString(dataRow["ArtistTitle"]);
            }

            if (dataRow["ImageUrl"] != null)
            {
                artist.ImageUrl = Convert.ToString(dataRow["ImageUrl"]);
            }

            if (dataRow["HeroUrl"] != null)
            {
                artist.HeroUrl = Convert.ToString(dataRow["HeroUrl"]);
            }

            if (dataRow["Biography"] != null)
            {
                artist.Biography = Convert.ToString(dataRow["Biography"]);
            }

            return artist;
        }

        private int AddArtistToDb(ArtistDto artist)
        {
            var sql = new SQL();
            if (artist == null)
            {
                return 0;
            }

            var dateCreation = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            var title = artist.Title;
            var biography = artist.Biography;
            var imageUrl = artist.ImageUrl;
            var heroUrl = artist.HeroUrl;
            var query = string.Format(_addArtistQuery, dateCreation, title, biography, imageUrl, heroUrl);
            var result = sql.Execute(query);
            return result;
        }
    }
}