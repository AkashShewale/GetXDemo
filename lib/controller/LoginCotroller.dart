import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_library/models/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginController extends GetxController
{
  void checkLogin(String userName, String password) async{

    LoginRequest loginRequest=LoginRequest(name: userName,email: password,role: "owner",password: "abc1232");

    var URL="http://143.110.245.148:8251/login";

    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String request = convert.jsonEncode(loginRequest.toJson());
      print('Request is as follows : ' + request);

      var response = await http.post(URL, body: request, headers: headers);

      print("URL: ${response.request.url}");
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");


    } catch (ex) {
      print(ex.toString());
    }
  }
}