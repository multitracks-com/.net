using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace BL.DTO
{
    public class SongDTO
    {
        public int SongId { get; set; }

        public DateTime DateCreation { get; set; }

        public int AlbumId { get; set; }

        public int ArtistId { get; set; }

        public string Title { get; set; } = null!;

        public decimal Bpm { get; set; }

        public string TimeSignature { get; set; } = null!;

        public bool Multitracks { get; set; }

        public bool CustomMix { get; set; }

        public bool Chart { get; set; }

        public bool RehearsalMix { get; set; }

        public bool Patches { get; set; }

        public bool SongSpecificPatches { get; set; }

        public bool ProPresenter { get; set; }

        public SongDTO(Song song)
        {
            SongId = song.SongId;
            DateCreation = song.DateCreation;
            AlbumId = song.AlbumId;
            ArtistId = song.ArtistId;
            Title = song.Title;
            Bpm = song.Bpm;
            TimeSignature = song.TimeSignatureNavigation.TimeSignature1;
            Multitracks = song.Multitracks;
            CustomMix = song.CustomMix;
            Chart = song.Chart;
            RehearsalMix = song.RehearsalMix;
            Patches = song.Patches;
            SongSpecificPatches = song.SongSpecificPatches;
            ProPresenter = song.ProPresenter;
        }

    }
}
