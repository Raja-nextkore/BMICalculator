import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../widget/bottom_button.dart';
import '../widget/custom_container.dart';

class ResultView extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultView({
    Key? key,
    required this.bmiResult,
    required this.interpretation,
    required this.resultText,
  }) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomContainer(
              color: kActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    widget.interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
