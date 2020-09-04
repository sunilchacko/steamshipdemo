using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SteamshipMutualSalesApi.Db;
using SteamshipMutualSalesApi.Model;

namespace SteamshipMutualSalesApi.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class SalesStatsController : ControllerBase
    {        

        private readonly ILogger<SalesStatsController> _logger;
        private readonly IConfiguration _configuration;
        private readonly IDbRepo _dbRepo;

        public SalesStatsController(IDbRepo dbRepo, IConfiguration configuration, ILogger<SalesStatsController> logger)
        {
            _logger = logger;
            _configuration = configuration;
            _dbRepo = dbRepo;
            
        }

        [HttpGet]
        public async Task<IEnumerable<SalesAggregates>> GetStaffSales()
        {
            return await _dbRepo.GetSalesAggregates();
        }


        [HttpGet]
        public async Task<IEnumerable<MonthlySales>> GetMonthlySales()
        {
            return await _dbRepo.GetMonthlySalesAggregates();
        }
    }
}
