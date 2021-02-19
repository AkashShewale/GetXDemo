import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return AlertDialog(
      title: Text("Action"),
      content: Text("Would you like to continue learning how to use Flutter alerts?"),
    );
  }
}
