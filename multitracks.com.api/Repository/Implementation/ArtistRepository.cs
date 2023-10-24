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
			var dataSet = sql.ExecuteStoredProcedureDS("SearchArtistDetailsByName");
			dataSet.SetTableNames("artistSearchResult");

			var artists = new List<GetArtistDto>();

			if (dataSet.Tables["artistSearchResult"].RowCount() <= 0) return artists;

			artists.AddRange(from DataRow row in dataSet.Tables["artistSearchResult"].Rows
				select new GetArtistDto
				{
					ArtistId = row.Field<int>("ArtistId"),
					Title = row.Field<string>("Title"),
					ImageUrl = row.Field<string>("ImageUrl"),
					Biography = row.Field<string>("Biography"),
					HeroUrl = row.Field<string>("HeroUrl")
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

			sql.Parameters.Add("@DateCreation", DateTime.Now.ToString("d"));
			sql.Parameters.Add("@Title", artist.Title);
			sql.Parameters.Add("@Biography", artist.Biography);
			sql.Parameters.Add("@ImageUrl", artist.ImageUrl);
			sql.Parameters.Add("@HeroUrl", artist.HeroUrl);
			var result = sql.ExecuteStoredProcedure("InsertArtist");
			return result;
		}
	}
}