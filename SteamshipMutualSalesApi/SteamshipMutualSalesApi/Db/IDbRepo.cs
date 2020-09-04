using SteamshipMutualSalesApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SteamshipMutualSalesApi.Db
{
    public interface IDbRepo
    {
        string ConnectionString { get; set; }
        Task<IEnumerable<SalesAggregates>> GetSalesAggregates();
        Task<IEnumerable<MonthlySales>> GetMonthlySalesAggregates();
    }
}
