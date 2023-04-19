﻿using System;
using System.Collections.Generic;

namespace DAL_EF.Models;

public partial class Album
{
    public int AlbumId { get; set; }

    public DateTime DateCreation { get; set; }

    public int ArtistId { get; set; }

    public string Title { get; set; } = null!;

    public string ImageUrl { get; set; } = null!;

    public int Year { get; set; }

    public virtual Artist Artist { get; set; } = null!;
}
