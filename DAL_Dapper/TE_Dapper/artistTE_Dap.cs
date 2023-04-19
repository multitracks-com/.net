using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper;
using DAL_Dapper.Models_Dapper;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace DAL_Dapper.TE_Dapper;
public class artistTE_Dap
{
    private const string ConnectionStr = "Data Source=localhost\\SQLExpress;Initial Catalog = MultiTracks; Integrated Security = True";

    public IEnumerable<artist_Dap> GetArtistByName(string name)
    {

        string trimmedName = name.Trim();

        IEnumerable<artist_Dap> lst = null;

        using (var db = new SqlConnection(ConnectionStr))
        {
            string sql = "SELECT artistID, title, biography, imageURL, heroURL FROM artist WHERE title LIKE '%' + @Name + '%'";

            var param = new { Name = trimmedName };

            lst = db.Query<artist_Dap>(sql, param);
        }

        return lst;
    }

    public bool CreateArtist(artist_Dap artist)
    {
        int rowsAffected = 0;

        using (var db = new SqlConnection(ConnectionStr))
        {
            const string query = "INSERT INTO Artist (dateCreation, title, biography, imageURL, heroURL)" +
            "VALUES (@Date, @Title, @Biography, @imageURL, @heroURL)";

            var param = new DynamicParameters();
            param.Add("@Date", DateTime.Now);
            param.Add("@Title", artist.title);
            param.Add("@Biography", artist.biography);
            param.Add("@imageURL", artist.imageURL);
            param.Add("@heroURL", artist.heroURL);

            rowsAffected = db.Execute(query, param);

            return rowsAffected > 0 ? true : false;
        }
    }

}
