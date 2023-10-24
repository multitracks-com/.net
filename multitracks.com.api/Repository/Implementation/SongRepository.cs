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

			sql.Parameters.Add("@PageSize", pageSize);
			sql.Parameters.Add("@PageNumber", pageNumber);

			var songsDataSet = sql.ExecuteStoredProcedureDS("GetPaginatedSongsList");

			songsDataSet.SetTableNames("songsResult");

			var songs = new List<SongDto>();

			if (songsDataSet.Tables["songsResult"].RowCount() <= 0) return songs;

			songs.AddRange(from DataRow row in songsDataSet.Tables["songsResult"].Rows
				select new SongDto()
				{
					SongId = row.Field<int>("SongId"),
					DateCreation = row.Field<DateTime>("DateCreation"),
					AlbumId = row.Field<int>("AlbumId"),
					ArtistId = row.Field<int>("ArtistId"),
					Title = row.Field<string>("Title"),
					Bpm = row.Field<decimal>("Bpm"),
					TimeSignature = row.Field<string>("TimeSignature"),
					MultiTracks = row.Field<bool>("MultiTracks"),
					CustomMix = row.Field<bool>("CustomMix"),
					Chart = row.Field<bool>("Chart"),
					RehearsalMix = row.Field<bool>("RehearsalMix"),
					Patches = row.Field<bool>("Patches"),
					SongSpecificPatches = row.Field<bool>("SongSpecificPatches"),
					ProPresenter = row.Field<bool>("ProPresenter"),
				});

			return songs;
		}
	}
}