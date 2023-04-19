using System;
using System.Collections.Generic;

namespace DAL_EF.Models;

public partial class TimeSignature
{
    public string IdTimeSignature { get; set; } = null!;

    public string TimeSignature1 { get; set; } = null!;

    public virtual ICollection<Song> Songs { get; set; } = new List<Song>();
}
