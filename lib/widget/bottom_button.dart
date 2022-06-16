import 'package:flutter/material.dart';

import '../constant/constant.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const BottomButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        decoration: const BoxDecoration(
          color: kBottomContainerColor,
        ),
        child: Center(
          child: Text(
            title,
            style: kBottomContainerTextStyle,
          ),
        ),
      ),
    );
  }
}
