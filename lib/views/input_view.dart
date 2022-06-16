import 'package:calculate_bmi/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/constant.dart';
import '../services/calculator_brain.dart';
import '../widget/bottom_button.dart';
import '../widget/custom_container.dart';
import '../widget/reusable_child.dart';
import '../widget/rounded_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  InputViewState createState() => InputViewState();
}

class InputViewState extends State<InputView> {
  Gender? selectedGender;
  int height = 180;
  int weight = 65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: selectedGender == Gender.male
                          ? kActiveColor
                          : kInActiveColor,
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: const ReusableChild(
                        title: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveColor
                          : kInActiveColor,
                      child: const ReusableChild(
                        title: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomContainer(
                color: kActiveColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData().copyWith(
                        thumbColor: kThumbColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kSliderInActiveColor,
                        overlayColor: kOverlayColor,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          min: 120.0,
                          max: 220.0,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: kActiveColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                onTap: () {
                                  setState(() {
                                    if (weight >= 1) {
                                      weight--;
                                    }
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: kActiveColor,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                onTap: () {
                                  setState(() {
                                    if (age >= 1) {
                                      age--;
                                    }
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    CalculatorBrain cal =
                        CalculatorBrain(height: height, weight: weight);
                    return ResultView(
                      bmiResult: cal.CalculateBMI(),
                      interpretation: cal.getInterpretation(),
                      resultText: cal.getResult(),
                    );
                  }),
                );
              },
              title: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
