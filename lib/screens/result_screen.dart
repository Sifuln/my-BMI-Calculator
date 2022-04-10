import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/component/bottom_button.dart';
import 'package:simple_bmi_calculator/component/reusable_card.dart';
import 'package:simple_bmi_calculator/constrants.dart';

class ResultScreen extends StatelessWidget{
  ResultScreen({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Your Result',
                    style: kTitleTextStyle,))),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toString(),
                      style: kresultTextStyle,),
                    Text(
                      bmiResult.toString(),
                      style: kBMITextStyle,),
                    Text(
                      interpretation.toString(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,)
                  ],
                ),
                onPress: (){}),
          ),
          BottomButton(onPress: (){}, title: 'Re-CALCULATE')
        ],
      ),
    );
  }
}