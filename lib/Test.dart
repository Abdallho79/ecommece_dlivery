import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
//  final String? buttontext;
//   final  void Function()? onPressed
  const TestScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const [
            Center(
              child: Text("TestController"),
            )
          ],
        ),
      ),
    );
  }
}
