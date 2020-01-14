class ApiResponseModel{
  int statuscode;
  String message;
  bool isError;
  dynamic data;
  
  ApiResponseModel.fromJson(obj) {
    this.statuscode = obj['StatusCode'];
    this.message = obj['msg'];
    this.isError = obj['IsError'];
    this.data = obj['Data'];
  }

}