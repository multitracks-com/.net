using DataAccess;
using multitracks.com.api.Models.Dtos;
using multitracks.com.api.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace multitracks.com.api.Repository.Implementation
{
	public class SongRepository : ISongRepository
	{
		public List<SongDto> GetListOfSongs(int pageSize, int pageNumber)
		{
			var sql = new SQL();

			sql.Parameters.Add("@pageSize", pageSize);
			sql.Parameters.Add("@pageNumber", pageNumber);

			var songsDataSet = sql.ExecuteStoredProcedureDS("GetPaginatedSongsList");

			songsDataSet.SetTableNames("SongsResult");

			var songs = new List<SongDto>();

			if (songsDataSet.Tables["SongsResult"].RowCount() <= 0) return songs;

			songs.AddRange(from DataRow row in songsDataSet.Tables["SongsResult"].Rows
				select new SongDto()
				{
					SongId = row.Field<int>("songId"),
					DateCreation = row.Field<DateTime>("dateCreation"),
					AlbumId = row.Field<int>("albumId"),
					ArtistId = row.Field<int>("artistId"),
					Title = row.Field<string>("title"),
					Bpm = row.Field<decimal>("bpm"),
					TimeSignature = row.Field<string>("timeSignature"),
					MultiTracks = row.Field<bool>("multiTracks"),
					CustomMix = row.Field<bool>("customMix"),
					Chart = row.Field<bool>("chart"),
					RehearsalMix = row.Field<bool>("rehearsalMix"),
					Patches = row.Field<bool>("patches"),
					SongSpecificPatches = row.Field<bool>("songSpecificPatches"),
					ProPresenter = row.Field<bool>("proPresenter"),
				});

			return songs;
		}
	}
}