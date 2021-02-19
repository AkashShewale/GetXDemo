import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_library/models/login.dart';
import 'package:getx_library/models/login_responce.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginController extends GetxController {
  LoginResponce responseFromApi;


  Future<LoginResponce> checkLogin(String userName, String password) async {
    LoginRequest loginRequest = LoginRequest(
        name: 'abc123',
        email: 'abc123@gmail.com',
        role: "owner",
        password: "abc1232");

    var URL = "http://143.110.245.148:8251/login";

    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String request = convert.jsonEncode(loginRequest.toJson());
      print('Request is as follows : ' + request);

      var response = await http.post(URL, body: request, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        responseFromApi = LoginResponce.fromJson(jsonResponse);
        print("Status is ${responseFromApi.status}");
      }
    } catch (ex) {
      print(ex.toString());
    }

    return responseFromApi;

  }
}
