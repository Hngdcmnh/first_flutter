
import 'package:first_project/test.dart';
import 'package:flutter/material.dart';

import 'demo.dart';
import 'introduce.dart';
import 'overview.dart';
import 'sign_in.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      initialRoute: IntroducePage.id,
      routes:
      {
        SignInPage.id: (context) => const SignInPage(),
        DemoPage.id: (context) => const DemoPage(),
        IntroducePage.id: (context) => const IntroducePage(),
        OverviewPage.id: (context)=> const OverviewPage(),
      },home: BarChartSample7(),
    );
  }
}




