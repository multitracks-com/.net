using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Dapper.Models_Dapper;
using Dapper;

namespace DAL_Dapper.TE_Dapper
{
    public class songTE_Dap
    {
        private string ConnectionStr = "Data Source=localhost\\SQLExpress;Initial Catalog = MultiTracks; Integrated Security = True";

        public pagedSongs_Dap GetSongs(int currentPageNumber, int pageSize)
        {
            currentPageNumber = currentPageNumber == 0 ? 1  : currentPageNumber;
            int maxPagSize = 50;
            pageSize = (pageSize > 0 && pageSize <= maxPagSize) ? pageSize : maxPagSize;

            int skip = (currentPageNumber - 1) * pageSize;
            int take = pageSize;

            string query = "SELECT COUNT(*)FROM Song " +
                "" +
                "SELECT * FROM Song " +
                "order By songID " +
                "OFFSET @Skip ROWS " +
                "FETCH NEXT @Take ROWS ONLY"
            ;

            using (var connection = new SqlConnection(ConnectionStr))
            {
                var reader = connection.QueryMultiple(query, new { Skip = skip, Take = take });

                int count = reader.Read<int>().FirstOrDefault();
                List<song_Dap> songList = reader.Read<song_Dap>().ToList();

                var result = new pagedSongs_Dap(songList, count, currentPageNumber, pageSize);
                return result;
            }
        }
    }
}
