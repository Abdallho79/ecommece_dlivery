import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 150,
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سمك الخط
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سمك الخط
          ),
        ),
      ],
    );
  }
}
