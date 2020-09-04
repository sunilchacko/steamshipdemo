import { TestBed } from '@angular/core/testing';

import { SalesStatsApiService } from './sales-stats-api.service';

describe('SalesStatsApiService', () => {
  let service: SalesStatsApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SalesStatsApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
