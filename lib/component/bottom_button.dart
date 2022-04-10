import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/constrants.dart';

class BottomButton extends StatelessWidget{
  final String title;
  final void Function() onPress;

  const BottomButton({Key? key, required this.onPress, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: Center(
              child: Text(
                title,
                style: kLargeButtonTextStyle,

              ),
          ),
          width: double.infinity,
          height: kBottomContainerHeight,
          color: kActiveGenderColor,
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}