import 'package:flutter/material.dart';

class Reuseable_Row extends StatelessWidget {
  Reuseable_Row({required this.title, required this.value});
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Divider(color: Colors.white),
      ],
    );
  }
}
