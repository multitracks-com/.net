using System;

namespace multitracks.com.api.Models.Dtos
{
	public class SongDto
	{
		public int SongId { get; set; }
		public DateTime DateCreation { get; set; }
		public int AlbumId { get; set; }
		public int ArtistId { get; set; }
		public string Title { get; set; }
		public decimal Bpm { get; set; }
		public string TimeSignature { get; set; }
		public bool MultiTracks { get; set; }
		public bool CustomMix { get; set; }
		public bool Chart { get; set; }
		public bool RehearsalMix { get; set; }
		public bool Patches { get; set; }
		public bool SongSpecificPatches { get; set; }
		public bool ProPresenter { get; set; }
	}
}