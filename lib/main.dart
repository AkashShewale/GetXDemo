import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_library/controller/LoginCotroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GetX Login Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var userNameController=TextEditingController();
  var passwordController=TextEditingController();

  var loginController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Enter Username',hintText: 'Username'),
                  controller: userNameController,
                ),

                SizedBox(height: 30),

                TextField(
                  decoration: InputDecoration(labelText: 'Enter password',hintText: 'Password'),
                  controller: passwordController,
                  obscureText: true,
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  child: Text("Login"),
                  onPressed: () {
                    //Get.to(SecondPage());
                    print('clicked on login button...');
                    loginController.checkLogin(userNameController.text,passwordController.text);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
