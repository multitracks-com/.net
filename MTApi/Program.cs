using MTBusiness.Business;
using MTBusiness.Business.Interfaces;
using MTDataAccess.Dao;
using MTDataAccess.Dao.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

builder.Services.AddScoped<IArtistBusiness, ArtistBusiness>();
builder.Services.AddScoped<ISongBusiness, SongBusiness>();
builder.Services.AddScoped<IAlbumBusiness, AlbumBusiness>();

builder.Services.AddScoped<IArtistDao, ArtistDao>();
builder.Services.AddScoped<ISongDao, SongDao>();
builder.Services.AddScoped<IAlbumDao, AlbumDao>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
