import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'views/input_view.dart';

void main() {
  runApp(
    const BMICalculator(),
  );
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppBarBackgroundColor,
        ),
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: const InputView(),
    );
  }
}
