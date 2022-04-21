import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'model/Company.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  static String id = '/OverviewPage';


  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Company;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Text(args.name),
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.green,
              ),
            ],
          ),
          Positioned(
            child: Container(
              child: BarChart(
                BarChartData(
                    gridData: FlGridData(
                      show: false,
                    ),
                  alignment: BarChartAlignment.start,
                    backgroundColor: Colors.white,
                    maxY: 30,
                    barTouchData: BarTouchData(enabled: true, allowTouchBarBackDraw: true),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                            toY: 20,
                            width: 15,
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(5))),
                        BarChartRodData(
                            toY: 20,
                            width: 15,
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(5)))
                      ])
                    ]),

                swapAnimationCurve: Curves.easeInBack,
                swapAnimationDuration: const Duration(seconds: 10),
              ),
              color: Colors.black,
            ),
            bottom: 20,left: 20,right: 20,

          )
        ],
      ),
    );
  }
}
