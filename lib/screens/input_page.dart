import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/gender_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum gender { male, female }
gender g;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;
  //  Color malecolour = inactiveCardColour;
//  Color femalecolour = inactiveCardColour;

//  updateColour(gender g) {
//    if (g == gender.male) {
//      malecolour = activeCardColour;
//      femalecolour = inactiveCardColour;
//    } else
//      malecolour = inactiveCardColour;
//    if (g == gender.female) {
//      femalecolour = activeCardColour;
//      malecolour = inactiveCardColour;
//    } else
//      femalecolour = inactiveCardColour;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          g = gender.male;
                        });
                      },
                      cardChild: GenderContent(
                        genderlabel: 'MALE',
                        gendericon: FontAwesomeIcons.mars,
                      ),
                      colour: g == gender.male
                          ? kactiveCardColour
                          : kinactiveCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          g = gender.female;
                        });
                      },
                      cardChild: GenderContent(
                        genderlabel: 'FEMALE',
                        gendericon: FontAwesomeIcons.venus,
                      ),
                      colour: g == gender.female
                          ? kactiveCardColour
                          : kinactiveCardColour,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: Color(0xff1d1e33),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('HEIGHT'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text('cm'),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xff8d8e98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xffeb1555),
                                overlayColor: Color(0x29eb1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 10),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 20)),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120,
                                max: 220,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: Color(0xff1d1e33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: klabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
                  //Expanded(child: ReusableCard(colour: Color(0xff1d1e33)))
                  Expanded(
                      child: ReusableCard(
                    colour: Color(0xff1d1e33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: klabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calcBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            ),
          ],
        ));
  }

//  Container buildReusableCard() {
//    return Container(
//      margin: EdgeInsets.all(10),
//      decoration: BoxDecoration(
//        color: Color(0xff1d1e33),
//        borderRadius: BorderRadius.circular(7.5),
//      ),
//    );
//  }
}
