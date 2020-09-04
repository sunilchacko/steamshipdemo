import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SalesStatsApiService {

  constructor(private http: HttpClient) { 
  }

  getSalesByStaff() :Observable<any[]>{   
   return this.http.get<any[]>('http://localhost:50703/SalesStats/GetStaffSales');
  }

  getSalesByMonth() :Observable<any[]>{   
    return this.http.get<any[]>('http://localhost:50703/SalesStats/GetMonthlySales');
   }
}
