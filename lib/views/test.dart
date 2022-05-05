import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(myChild: MyCenterWidget(),),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({required this.myChild});
  final Widget myChild;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyInheritedWidget(
        child: widget.myChild,
        myData: counter,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final counter = MyInheritedWidget.of(context)?.myData;

    return Text('Number: $counter');
  }
}

class MyInheritedWidget extends InheritedWidget {

  MyInheritedWidget({required Widget child, required this.myData}) : super(child: child);

  final int myData;

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return myData != oldWidget.myData;
  }

  static MyInheritedWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}