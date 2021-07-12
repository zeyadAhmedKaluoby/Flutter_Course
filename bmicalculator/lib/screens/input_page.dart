import 'package:bmicalculator/screens/calculator_brain.dart';
import 'package:bmicalculator/screens/result_page.dart';
import 'package:bmicalculator/components/round_material_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/ReusableCard.dart';
import '../components/buttom_button.dart';
import '../constants.dart';
import 'package:bmicalculator/components/icon_widget.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 100;
  int weight = 30;
  int age = 10;
  /* Color maleCardColor = Color( inActiveCardColor);
  Color femaleCardColor = Color( inActiveCardColor);
  void updateColor(Gender gender)
  {
    if(gender ==Gender.male)
      {
        if(maleCardColor==Color(inActiveCardColor))
          {
            maleCardColor=Color(cardColor);
            femaleCardColor=Color(inActiveCardColor);

          }else{
          maleCardColor=Color(inActiveCardColor);
        }
      }
    if(gender==Gender.female)
        {
          if(femaleCardColor==Color(inActiveCardColor))
          {
            femaleCardColor=Color(cardColor);
            maleCardColor=Color(inActiveCardColor);

          }else{
            femaleCardColor=Color(inActiveCardColor);
          }
        }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? Color(kCardColor)
                        : Color(kInActiveCardColor),
                    cardChild: IconWidget(
                        iconContent: FontAwesomeIcons.mars,
                        textContent: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? Color(kCardColor)
                        : Color(kInActiveCardColor),
                    cardChild: IconWidget(
                      iconContent: FontAwesomeIcons.female,
                      textContent: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: Color(kCardColor),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kTextContentStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text(
                      'cm',
                      style: kTextContentStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    thumbColor: Color(kSliderActiveColor),
                    overlayColor: Color(kSliderOverelayColor),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 50,
                    max: 250,
                    activeColor: Color(kBottomContainerColor),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextContentStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(Icons.add),
                            backgroundColor: Color(kFloatingWeightColor),
                          ),*/
                          RoundMaterialButton(
                              child: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          /*FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.minimize),
                            backgroundColor: Color(kFloatingWeightColor),
                          )*/
                          RoundMaterialButton(
                            child: Icons.minimize,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  color: Color(kCardColor),
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTextContentStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(Icons.add),
                            backgroundColor: Color(kFloatingWeightColor),
                          ),*/
                          RoundMaterialButton(
                              child: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          /*FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(Icons.minimize),
                            backgroundColor: Color(kFloatingWeightColor),
                          )*/
                          RoundMaterialButton(
                            child: Icons.minimize,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  color: Color(kCardColor),
                ))
              ],
            ),
          ),
          BottomButton(onPress:  (){
            CalculatorBrain calculatorBrain = CalculatorBrain(weight: weight.toDouble(), height: height.toDouble());

    Navigator.push(context, MaterialPageRoute(builder: (context){
    return ResultPage(bmiResult:    calculatorBrain.calculateBMI(),resultText: calculatorBrain.getResult(),interpolationText: calculatorBrain.getInterpretation(),);
    }));},text: 'Calculate',)
        ],
      ),
    );
  }
}
