using DataAccess;
using multitracks.com.api.Models.Dtos;
using multitracks.com.api.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace multitracks.com.api.Repository.Implementation
{
	public class ArtistRepository : IArtistRepository
	{
		public List<GetArtistDto> SearchArtists(string artistName)
		{
			var sql = new SQL();
			sql.Parameters.Add("@artistName", artistName);
			var data = sql.ExecuteStoredProcedureDS("SearchArtistDetailsByName");
			data.SetTableNames("ArtistSearchResult");

			var artists = new List<GetArtistDto>();

			if (data.Tables["ArtistSearchResult"].RowCount() <= 0) return artists;

			artists.AddRange(from DataRow row in data.Tables["ArtistSearchResult"].Rows
				select new GetArtistDto
				{
					ArtistId = row.Field<int>("artistId"),
					Title = row.Field<string>("title"),
					ImageUrl = row.Field<string>("imageUrl"),
					Biography = row.Field<string>("biography"),
					HeroUrl = row.Field<string>("heroUrl")
				});

			return artists;
		}

		public int AddArtist(AddArtistDto artist)
		{
			var sql = new SQL();

			if (artist == null)
			{
				return 0;
			}

			sql.Parameters.Add("@dateCreation", DateTime.Now.ToString("d"));
			sql.Parameters.Add("@title", artist.Title);
			sql.Parameters.Add("@biography", artist.Biography);
			sql.Parameters.Add("@imageUrl", artist.ImageUrl);
			sql.Parameters.Add("@heroUrl", artist.HeroUrl);
			var result = sql.ExecuteStoredProcedure("InsertArtist");
			return result;
		}
	}
}