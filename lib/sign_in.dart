import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static String id = '/SignInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  var _controller = TextEditingController();
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
          padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: 'Số điện thoại/Email',
                    border: OutlineInputBorder()),

              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintText: 'Mật khẩu',
                  border: OutlineInputBorder(),

                ),
              ),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){}, child: Text('Đăng nhập')),

              TextButton(onPressed: (){},style: TextButton.styleFrom(primary: Colors.blue), child: Text('Quên mật khẩu?')),
              TextButton(onPressed: (){},style: TextButton.styleFrom(primary: Colors.black26), child: Text('Đăng kí với tên miền khác'))

            ],
          ),
        ));
  }
}
