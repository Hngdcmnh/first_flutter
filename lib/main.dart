
import 'package:first_project/views/add.dart';
import 'package:first_project/views/demo.dart';
import 'package:first_project/views/home.dart';
import 'package:first_project/views/sign_in.dart';

import 'package:flutter/material.dart';
import 'views/introduce.dart';
import 'views/overview/overview.dart';

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
        AddPage.id: (context)=> const AddPage(),
        HomePage.id: (context)=> const HomePage(),
      },
    );
  }
}




