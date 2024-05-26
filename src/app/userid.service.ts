import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UseridService {

  constructor(private http: HttpClient) { }

  getUser() {
    return this.http.get<any>('http://localhost:8000/getUser');
  }

}
