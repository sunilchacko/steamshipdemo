using Dapper;
using Microsoft.Extensions.Configuration;
using SteamshipMutualSalesApi.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SteamshipMutualSalesApi.Db
{
    public class DbRepo : IDbRepo
    {
        public string ConnectionString { get; set; }

        public DbRepo(IConfiguration configuration)
        {
            ConnectionString = configuration.GetConnectionString("sqlDb");
        }
        public async Task<IEnumerable<SalesAggregates>> GetSalesAggregates()
        {
            using (IDbConnection dbConnection = new SqlConnection(ConnectionString))
            {
                return await dbConnection.QueryAsync<SalesAggregates>("spTotalSalesByStaff", null, commandType: CommandType.StoredProcedure);
            }

        }
        public async Task<IEnumerable<MonthlySales>> GetMonthlySalesAggregates()
        {
            using (IDbConnection dbConnection = new SqlConnection(ConnectionString))
            {
                return await dbConnection.QueryAsync<MonthlySales>("spTotalSalesByMonth", null, commandType: CommandType.StoredProcedure);
            }
        }

    }
}
