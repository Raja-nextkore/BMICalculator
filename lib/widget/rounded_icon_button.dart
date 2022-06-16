import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const RoundedIconButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      elevation: 0.0,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
