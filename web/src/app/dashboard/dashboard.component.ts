import { Component, OnInit } from '@angular/core';
import * as Chartist from 'chartist';
import { SalesStatsApiService } from 'app/sales-stats-api.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  public managers : any[];
  public salesData : any[];
  public monthlySales : any[];

  constructor( public saleStatsService : SalesStatsApiService) {
    this.managers = [];
    this.salesData = [];
    this.monthlySales = [];
   }
  startAnimationForLineChart(chart){
      let seq: any, delays: any, durations: any;
      seq = 0;
      delays = 80;
      durations = 500;

      chart.on('draw', function(data) {
        if(data.type === 'line' || data.type === 'area') {
          data.element.animate({
            d: {
              begin: 600,
              dur: 700,
              from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
              to: data.path.clone().stringify(),
              easing: Chartist.Svg.Easing.easeOutQuint
            }
          });
        } else if(data.type === 'point') {
              seq++;
              data.element.animate({
                opacity: {
                  begin: seq * delays,
                  dur: durations,
                  from: 0,
                  to: 1,
                  easing: 'ease'
                }
              });
          }
      });

      seq = 0;
  };
  startAnimationForBarChart(chart){
      let seq2: any, delays2: any, durations2: any;

      seq2 = 0;
      delays2 = 80;
      durations2 = 500;
      chart.on('draw', function(data) {
        if(data.type === 'bar'){
            seq2++;
            data.element.animate({
              opacity: {
                begin: seq2 * delays2,
                dur: durations2,
                from: 0,
                to: 1,
                easing: 'ease'
              }
            });
        }
      });

      seq2 = 0;
  };
  ngOnInit() {
    
      this.saleStatsService.getSalesByStaff().subscribe((d)=>{
        this.salesData = d;
        for(var s of this.salesData){        
            var index = this.managers.map(m => m.name ).indexOf(s["manager"])
            if(index < 0){
              console.log('here');
              var item = {name : s["manager"], sales : s["salesTotal"] };
                this.managers.push(item);          
            }
            else{             
               this.managers[index]["sales"] += s["salesTotal"]
            }                     
        }
        
        this.populateStaffSales();
        
    })
    var months = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"];

    this.saleStatsService.getSalesByMonth().subscribe((d)=>{      
      d.sort(function(a, b){
        return months.indexOf(a["salesMonth"])
             - months.indexOf(b["salesMonth"]);
      });
      this.monthlySales = d;
      this.populateMonthlySales();      
  });

  
  
}

  populateStaffSales(){
    const dataDailySalesChart: any = {
      labels: [],
      series: [[]]
    };
     this.salesData.forEach((item)=>{
      dataDailySalesChart['labels'].push(item["staffName"]);
      dataDailySalesChart['series'][0].push(item["salesTotal"]);
     });
     console.log(dataDailySalesChart)
  
      const optionsDailySalesChart: any = {
          lineSmooth: Chartist.Interpolation.cardinal({
          tension: 0
      }),
      low: 0,
      high: 1200, 
      chartPadding: { top: 0, right: 0, bottom: 0, left: 0},
    }
  
    var dailySalesChart = new Chartist.Line('#dailySalesChart', dataDailySalesChart, optionsDailySalesChart);
  
    this.startAnimationForLineChart(dailySalesChart);
  
  }

  populateMonthlySales(){
    var datawebsiteViewsChart = {
      labels: [],
      series: [[]]
    };
    var optionswebsiteViewsChart = {
      axisX: {
          showGrid: false
      },
      low: 0,
      high: 1000,
      chartPadding: { top: 0, right: 5, bottom: 0, left: 0}
  };

  var responsiveOptions: any[] = [
    ['screen and (max-width: 640px)', {
      seriesBarDistance: 5,
      axisX: {
        labelInterpolationFnc: function (value) {
          return value[0];
        }
      }
    }]
  ];

    this.monthlySales.forEach((item)=>{
      datawebsiteViewsChart['labels'].push(item["salesMonth"]);
      datawebsiteViewsChart['series'][0].push(item["salesTotal"]);
     });
     console.log(datawebsiteViewsChart);
    var websiteViewsChart = new Chartist.Bar('#websiteViewsChart', datawebsiteViewsChart, optionswebsiteViewsChart, responsiveOptions);
  
        //start animation for the Emails Subscription Chart
        this.startAnimationForBarChart(websiteViewsChart);
  }


}
