using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DAL.Models;

public partial class MultiTracksContext : DbContext
{
    public MultiTracksContext()
    {
    }

    public MultiTracksContext(DbContextOptions<MultiTracksContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Album> Albums { get; set; }

    public virtual DbSet<Artist> Artists { get; set; }

    public virtual DbSet<AssessmentStep> AssessmentSteps { get; set; }

    public virtual DbSet<Song> Songs { get; set; }

    public virtual DbSet<TimeSignature> TimeSignatures { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost\\SQLExpress;Initial Catalog=MultiTracks;Integrated Security=True;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Album>(entity =>
        {
            entity.HasKey(e => e.AlbumId).HasName("PK__Album__75BF3EEFA24D32F3");

            entity.ToTable("Album");

            entity.Property(e => e.AlbumId).HasColumnName("albumID");
            entity.Property(e => e.ArtistId).HasColumnName("artistID");
            entity.Property(e => e.DateCreation)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("smalldatetime")
                .HasColumnName("dateCreation");
            entity.Property(e => e.ImageUrl)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("imageURL");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("title");
            entity.Property(e => e.Year).HasColumnName("year");

            entity.HasOne(d => d.Artist).WithMany(p => p.Albums)
                .HasForeignKey(d => d.ArtistId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Album_Artist");
        });

        modelBuilder.Entity<Artist>(entity =>
        {
            entity.HasKey(e => e.ArtistId).HasName("PK__Artist__4F439367301954D5");

            entity.ToTable("Artist");

            entity.Property(e => e.ArtistId).HasColumnName("artistID");
            entity.Property(e => e.Biography)
                .IsUnicode(false)
                .HasColumnName("biography");
            entity.Property(e => e.DateCreation)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("smalldatetime")
                .HasColumnName("dateCreation");
            entity.Property(e => e.HeroUrl)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("heroURL");
            entity.Property(e => e.ImageUrl)
                .HasMaxLength(500)
                .IsUnicode(false)
                .HasColumnName("imageURL");
            entity.Property(e => e.Title)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("title");
        });

        modelBuilder.Entity<AssessmentStep>(entity =>
        {
            entity.HasKey(e => e.StepId).HasName("PK__Assessme__4E25C23D9AF89F75");

            entity.Property(e => e.StepId).HasColumnName("stepID");
            entity.Property(e => e.Text)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("text");
        });

        modelBuilder.Entity<Song>(entity =>
        {
            entity.HasKey(e => e.SongId).HasName("PK__Song__0364D6ADDF006081");

            entity.ToTable("Song");

            entity.Property(e => e.SongId).HasColumnName("songID");
            entity.Property(e => e.AlbumId).HasColumnName("albumID");
            entity.Property(e => e.ArtistId).HasColumnName("artistID");
            entity.Property(e => e.Bpm)
                .HasColumnType("decimal(6, 2)")
                .HasColumnName("bpm");
            entity.Property(e => e.Chart).HasColumnName("chart");
            entity.Property(e => e.CustomMix).HasColumnName("customMix");
            entity.Property(e => e.DateCreation)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("smalldatetime")
                .HasColumnName("dateCreation");
            entity.Property(e => e.Multitracks).HasColumnName("multitracks");
            entity.Property(e => e.Patches).HasColumnName("patches");
            entity.Property(e => e.ProPresenter).HasColumnName("proPresenter");
            entity.Property(e => e.RehearsalMix).HasColumnName("rehearsalMix");
            entity.Property(e => e.SongSpecificPatches).HasColumnName("songSpecificPatches");
            entity.Property(e => e.TimeSignature)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("timeSignature");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("title");

            entity.HasOne(d => d.TimeSignatureNavigation).WithMany(p => p.Songs)
                .HasForeignKey(d => d.TimeSignature)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Song_TimeSignature");
        });

        modelBuilder.Entity<TimeSignature>(entity =>
        {
            entity.HasKey(e => e.IdTimeSignature);

            entity.ToTable("TimeSignature");

            entity.Property(e => e.IdTimeSignature)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("idTimeSignature");
            entity.Property(e => e.TimeSignature1)
                .HasMaxLength(5)
                .HasColumnName("timeSignature");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
