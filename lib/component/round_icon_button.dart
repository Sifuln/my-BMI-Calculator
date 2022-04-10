import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget{
  final IconData icon;
  final void Function() onPressed;

  const RoundButton({Key? key, required this.icon, required this.onPressed}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
       shape: const CircleBorder(),
      fillColor: const Color(0xFF4c4F5E),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
    );
  }
}