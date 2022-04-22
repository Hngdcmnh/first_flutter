import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'model/Company.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  static String id = '/OverviewPage';
  static const dataList = [
    _BarData(15),
    _BarData(14),
    _BarData(10),
    _BarData(2.5),
    _BarData(2),
    _BarData(2),
  ];

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _BarData {
  // final Color color;
  final double value;

  // final double shadowValue;

  const _BarData(this.value);
}

class _OverviewPageState extends State<OverviewPage> {
  BarChartGroupData generateBarGroup(
    int x,
    // Color color,
    double value,
    // double shadowValue,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4)),
          borderSide: BorderSide(width: 2, color: Colors.orange),
          toY: value,
          color: Colors.green,
          width: 20,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Company;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.name),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black12,
                ),
              ],
            ),
            Positioned(
              child: AspectRatio(
                aspectRatio: 1,
                child: BarChart(
                  BarChartData(

                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        drawBehindEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Color(0xFF606060),
                              ),
                              textAlign: TextAlign.left,
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        drawBehindEverything: true,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Color(0xFF606060),
                              ),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                    ),
                    borderData: FlBorderData(

                      show: true,
                      border: const Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFececec),
                        ),
                      ),
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                    alignment: BarChartAlignment.spaceAround,
                    backgroundColor: Colors.white,
                    maxY: 20,
                    barTouchData: BarTouchData(
                        enabled: true, allowTouchBarBackDraw: true),
                    barGroups: OverviewPage.dataList.asMap().entries.map((e) {
                      final index = e.key;
                      final data = e.value;
                      return generateBarGroup(index, data.value);
                    }).toList(),
                    // barGroups: [
                    //   BarChartGroupData(x: 0, barRods: [
                    //     BarChartRodData(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(4),
                    //             topRight: Radius.circular(4)),
                    //         borderSide:
                    //             BorderSide(width: 2, color: Colors.orange),
                    //         toY: 10,
                    //         width: 20,
                    //         color: Colors.green),
                    //   ]),
                    //   BarChartGroupData(x: 1, barRods: [
                    //     BarChartRodData(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(4),
                    //             topRight: Radius.circular(4)),
                    //         toY: 15,
                    //         width: 20,
                    //         color: Colors.green),
                    //   ]),
                    //   BarChartGroupData(x: 2, barRods: [
                    //     BarChartRodData(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(4),
                    //             topRight: Radius.circular(4)),
                    //         toY: 10,
                    //         width: 20,
                    //         color: Colors.green),
                    //   ]),
                    //   BarChartGroupData(x: 0, barRods: [
                    //     BarChartRodData(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(4),
                    //             topRight: Radius.circular(4)),
                    //         toY: 10,
                    //         width: 20,
                    //         color: Colors.green),
                    //   ]),
                    //   BarChartGroupData(x: 0, barRods: [
                    //     BarChartRodData(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(4),
                    //             topRight: Radius.circular(4)),
                    //         toY: 10,
                    //         width: 20,
                    //         color: Colors.green),
                    //   ]),
                    // ],
                  ),

                  // swapAnimationCurve: Curves.easeInBack,
                  // swapAnimationDuration: const Duration(seconds: 10),
                ),
              ),
              left: 20,
              top: 20,
              right: 20,
            ),
          ],
        ));
  }
}
