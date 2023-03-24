using MTDataAccess.Domain;
using System;
using System.Collections.Generic;
using System.Data;

namespace MTDataAccess.Extensions
{
    public static class DomainExtensions
    {
        public static List<Artist> TranslateToArtistDomain(this DataTable dataTable)
        {
            var artistList = new List<Artist>();

            foreach (DataRow artist in dataTable.Rows)
            {
                var artistId = Convert.ToInt32(artist["ArtistId"].ToString());

                artistList.Add(new Artist
                {
                    ArtistId = Convert.ToInt32(artist["ArtistId"].ToString()),
                    DateCreation = Convert.ToDateTime(artist["DateCreation"].ToString()),
                    Name = artist["ArtistName"].ToString(),
                    Biography = artist["ArtistBiography"].ToString(),
                    ImageUrl = artist["ArtistImageUrl"].ToString(),
                    HeroImageUrl = artist["ArtistHeroImageUrl"].ToString()
                });
            }

            return artistList;
        }

        public static List<Album> TranslateToAlbumDomain(this DataTable dataTable)
        {
            var albumList = new List<Album>();

            foreach (DataRow album in dataTable.Rows)
            {
                var albumId = Convert.ToInt32(album["AlbumId"].ToString());

                albumList.Add(new Album
                {
                    AlbumId = albumId,
                    ArtistName = album["ArtistName"].ToString(),
                    DateCreation = Convert.ToDateTime(album["DateCreation"].ToString()),
                    Title = album["AlbumTitle"].ToString(),
                    ImageUrl = album["AlbumImageUrl"].ToString(),
                    ReleaseYear = Convert.ToInt32(album["ReleaseYear"].ToString()),
                });
            }

            return albumList;
        }

        public static List<Song> TranslateToSongDomain(this DataTable dataTable)
        {
            var songList = new List<Song>();

            foreach (DataRow song in dataTable.Rows)
            {
                songList.Add(new Song
                {
                    SongId = Convert.ToInt32(song["SongId"].ToString()),
                    DateCreation = Convert.ToDateTime(song["DateCreation"].ToString()),
                    Title = song["SongTitle"].ToString(),
                    ArtistName = song["ArtistName"].ToString(),
                    AlbumTitle = song["AlbumTitle"].ToString(),
                    Bpm = Convert.ToDecimal(song["Bpm"].ToString()),
                    TimeSignature = song["TimeSignature"].ToString(),
                    HasMultiTracks = Convert.ToBoolean(song["HasMultiTracks"].ToString()),
                    HasCustomMix = Convert.ToBoolean(song["HasCustomMix"].ToString()),
                    HasChordChart = Convert.ToBoolean(song["HasChordChart"].ToString()),
                    HasRehearsalMix = Convert.ToBoolean(song["HasRehearsalMix"].ToString()),
                    HasPatches = Convert.ToBoolean(song["HasPatches"].ToString()),
                    HasSongSpecificPatches = Convert.ToBoolean(song["HasSongSpecificPatches"].ToString()),
                    HasProPresenterSlides = Convert.ToBoolean(song["HasProPresenterSlides"].ToString())
                });
            }
            return songList;
        }
    }
}