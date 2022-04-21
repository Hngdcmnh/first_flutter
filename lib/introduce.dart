
import 'package:flutter/material.dart';

import 'demo.dart';
import 'sign_in.dart';



class IntroducePage extends StatefulWidget {
  const IntroducePage({Key? key}) : super(key: key);
  static String id = '/IntroducePage';

  @override
  State<IntroducePage> createState() => _IntroducePageState();
}

class _IntroducePageState extends State<IntroducePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Tiếng Việt'),
                    Icon(Icons.arrow_right),
                  ],
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  child: const Text('Đăng nhập')),
              TextButton(
                  onPressed: () {

                    Navigator.pushNamed(context, DemoPage.id);
                  },
                  child: const Text('Xem dữ liệu demo')),
            ],
          ),
        ));
  }
}
