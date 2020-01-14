import 'dart:convert';
import 'dart:io';

import 'package:iconfezz/Models/ApiResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:iconfezz/PredefinedFiles/appConstatant.dart';

class AnonymousService{
  
   static Future<ApiResponseModel> postLogin(Map<String, dynamic> body) async {
    String url = apiUrl + 'api/Anonymous/Login';
    http.Response response = await http.post(
      url,
      body: json.encode(body),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
    // The response body is an array of items
    if (response != null && response.statusCode == HttpStatus.ok) { 
      return ApiResponseModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}