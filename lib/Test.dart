import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
//  final String? buttontext;
//   final  void Function()? onPressed
  TestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
              Center(child: Text("TestController"),)
            ],

        ),
      ),
    );
  }
}
