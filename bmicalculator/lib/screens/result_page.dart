import 'package:bmicalculator/components/ReusableCard.dart';
import 'package:bmicalculator/components/buttom_button.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpolationText;
  ResultPage({required this.bmiResult,required this.interpolationText,required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculaotr'),),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(child: Text('Your Result',style: kTitleTextStyle,),))
      ,
        Expanded(flex:5,child: ReusableCard(color: Color(kCardColor) ,cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(child: Center(child: Text(resultText,style: kResultTextStyle,))),
            Expanded(
              child: Center(child: Text(
                bmiResult,style: kNumberTextStyle,
              ),),
            ),
              Expanded( child: Center(child: Text(interpolationText))),
            Expanded(child: BottomButton(onPress: (){Navigator.pop(context);}, text: 'Re-Calculate'))
          ],

        ),))
      ],),
    );
  }
}
