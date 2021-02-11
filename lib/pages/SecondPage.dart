import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/controller/HomeController.dart';

class SecondPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<SecondPage> {
  var userStateController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //userStateController.getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
      ),
      body: Container(
        child:GetX<HomeController>(
          builder: (controller) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userStateController.userListData.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    trailing: GestureDetector(
                        onTap: () {
                          userStateController.deleteElement(index);
                        },
                        child: Icon(Icons.delete)),
                    title: Text("${userStateController.userListData[index].name}"),
                  );
                },
              );
          }
        ),
      ),
    );
  }
}
