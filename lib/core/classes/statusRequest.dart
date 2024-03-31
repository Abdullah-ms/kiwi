enum StatusRequest {
  success ,
  loading ,
  offline ,
  // means there is no connection with server (error 404) , the server not reached/wrong php page ...etc
  serverFailure ,
  // means no updates if it is insert, update or delete process , and it means noData if it's a view process
  noData ,
  exceptionError,
  none
}