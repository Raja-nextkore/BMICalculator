import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ReusableChild extends StatelessWidget {
  final String title;
  final IconData icon;
  const ReusableChild({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
