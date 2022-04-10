import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/component/bottom_button.dart';
import 'package:simple_bmi_calculator/component/icon_content.dart';
import 'package:simple_bmi_calculator/component/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_bmi_calculator/component/round_icon_button.dart';
import 'package:simple_bmi_calculator/constrants.dart';
import 'package:simple_bmi_calculator/main.dart';
import 'package:simple_bmi_calculator/screens/result_screen.dart';
import 'package:simple_bmi_calculator/utils/calculate_bmi.dart';

enum Gender{
  male,
  female
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: selectedGender == Gender.male ? kActiveGenderColor : kInactiveCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                      colour:  selectedGender == Gender.female ? kActiveGenderColor : kInactiveCardColour,
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: kLabelTextStyle,
                    ),
                    Text(
                        height.toString(),
                        style: kNumberTextStyle,
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ))
                  ],
                ),
                onPress: (){

                }),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT"),
                          Text(weight.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                RoundButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                              SizedBox(width: 10.0,),
                              RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                        weight++;
                              });})
                            ],
                          )
                        ],
                      ),
                      onPress: (){}),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",style: kLabelTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                  }),
                              SizedBox(width: 10.0,),
                              RoundButton(icon: FontAwesomeIcons.plus, onPressed: (){
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                      onPress: (){}),
                )

              ],
            ),
          ),
          BottomButton(
              onPress: (
              ){
                BMILogic bmi = BMILogic(height: height, weight: weight);
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(bmiResult: bmi.calculateBMI(), resultText: bmi.getResult(), interpretation: bmi.getInterpretation())));
                
          }, title: "Calculate")
        ],

      ),
    );
  }
}
