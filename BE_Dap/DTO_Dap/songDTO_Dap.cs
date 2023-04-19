using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Dapper.Models_Dapper;

namespace BL_Dap.DTO_Dap
{
    public class songDTO_Dap
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
        public songDTO_Dap(song_Dap song_Dap)
        {
            SongId = song_Dap.SongId;
            DateCreation = song_Dap.DateCreation;
            AlbumId = song_Dap.AlbumId;
            ArtistId = song_Dap.ArtistId;
            Title = song_Dap.Title;
            Bpm = song_Dap.Bpm;
            TimeSignature = song_Dap.TimeSignature;
            Multitracks = song_Dap.Multitracks;
            CustomMix = song_Dap.CustomMix;
            Chart = song_Dap.Chart;
            RehearsalMix = song_Dap.RehearsalMix;
            Patches = song_Dap.Patches;
            SongSpecificPatches = song_Dap.SongSpecificPatches;
            ProPresenter = song_Dap.ProPresenter;
        }
    }
}
