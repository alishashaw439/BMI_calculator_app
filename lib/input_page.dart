import 'package:bmi_calculator/calculate_brain.dart' as prefix0;
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'round_icon.dart';
import 'calculate_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
//  Color maleCardColor = inactiveCardColour;
//  Color femaleCardColor = inactiveCardColour;
//  void updateColor(GenderType gender) {
//
//  }
//  if (gender == GenderType.male) {
//  if (maleCardColor == inactiveCardColour) {
//  maleCardColor = activeCardColour;
//  femaleCardColor = inactiveCardColour;
//  } else {
//  maleCardColor = inactiveCardColour;
//  }
//  }
//  if (gender == GenderType.female) {
//  if (femaleCardColor == inactiveCardColour) {
//  femaleCardColor = activeCardColour;
//  maleCardColor = inactiveCardColour;
//  } else {
//  femaleCardColor = inactiveCardColour;
//  }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: Card_Content(
                        icons: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: selectedGender == GenderType.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: Card_Content(
                          icons: FontAwesomeIcons.venus, label: 'FEMALE')),
                ),
              ],
            ),
          ),
          Expanded(
            child: new ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberSize),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0XFFEB1555),
                      overlayColor: Color(0X29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 24.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0XFFBDBE98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberSize),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberSize),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmiResult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  }),
                );
              },
              textTitle: 'CALCULATE'),
        ],
      ),
    );
  }
}
