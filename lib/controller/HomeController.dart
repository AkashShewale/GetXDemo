import 'package:get/get.dart';
import 'package:getx_library/models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsersData();
  }

  // ignore: deprecated_member_use
  var userListData = List<Users>().obs;

  void getUsersData() async {
    String link = "https://jsonplaceholder.typicode.com/users";
    var res = await http.get(link);
    if (res.statusCode == 200) {
      String responseBody = res.body; //2
      dynamic jsonObject = json.decode(responseBody); //3
      final convertedJsonObject = jsonObject.cast<Map<String, dynamic>>(); //4
      userListData.assignAll(convertedJsonObject
          .map<Users>((json) => Users.fromJson(json))
          .toList());
    }
  }

  void deleteElement(int position) {
    userListData.removeAt(position);
  }
}
