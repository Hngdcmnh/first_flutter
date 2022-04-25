import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'model/Company.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  static String id = '/OverviewPage';
  static const dataList = [
    _BarData(15),
    _BarData(14),
    _BarData(2.5),
    _BarData(2.5),
    _BarData(2),
    _BarData(2),
    _BarData(2.5),
    _BarData(2.5),
    _BarData(2.5),
    _BarData(9),
    _BarData(9),
    _BarData(12),
    _BarData(16),
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

class _OverviewPageState extends State<OverviewPage>
    with TickerProviderStateMixin {
  late TabController _tabControllerRevenue;
  late TabController _tabControllerBestSeller;

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
          borderSide: BorderSide(width: 2, color: Colors.black26),
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
  void initState() {
    super.initState();
    _tabControllerRevenue = TabController(length: 3, vsync: this);
    _tabControllerBestSeller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text('Công ty'),
      ),
      body: Stack(
        children: [
          buildBackground(),
          // Positioned(
          //   child:
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
                child: Column(
                  children: [buildRevenueChart(),buildBestSeller()],
                ),
              ),
        ),
          //   left: 20,
          //   top: 20,
          //   right: 20,
          // ),
        ],
      ),
    );
  }

  Column buildBackground() {
    return Column(
      children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green,
                  Colors.white,
                ],
              ),
            )),
      ],
    );
  }

  Container buildBestSeller() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(
              2.0,
              2.0,
            ), // shadow direction: bottom right
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(
              -2.0,
              -2.0,
            ),
            // shadow direction: bottom right
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 500,
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mặt hàng bán chạy',
                  style: TextStyle(fontSize: 20),
                ),
                DropdownButton(items: [
                  DropdownMenuItem(child: Text('Năm nay')),
                ], onChanged: null)
              ],
            ),


            SizedBox(
              height: 200,
              child: DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('TabBar Widget'),
                    bottom:TabBar(
                      tabs: <Widget>[
                        Tab(
                          text:'Doanh thu',
                        ),
                        Tab(
                          text:'Số lượng',
                        ),

                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Center(
                        child: Text("Doanh thu"),
                      ),
                      Center(
                        child: Text("Số lượng"),
                      ),

                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }



  Container buildRevenueChart() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(
              2.0,
              2.0,
            ), // shadow direction: bottom right
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(
              -2.0,
              -2.0,
            ),
            // shadow direction: bottom right
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Doanh thu',
                style: TextStyle(fontSize: 20),
              ),
              DropdownButton(items: [
                DropdownMenuItem(child: Text('Năm nay')),
              ], onChanged: null)
            ],
          ),
          AspectRatio(
            aspectRatio: 1,
            child: BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    drawBehindEverything: true,
                    sideTitles: SideTitles(
                      showTitles: false,
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
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    dashArray: null,
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border.symmetric(
                    horizontal: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                alignment: BarChartAlignment.spaceAround,
                backgroundColor: Colors.white,
                maxY: 20,
                barTouchData:
                    BarTouchData(enabled: true, allowTouchBarBackDraw: true),
                barGroups: OverviewPage.dataList.asMap().entries.map((e) {
                  final index = e.key;
                  final data = e.value;
                  return generateBarGroup(index, data.value);
                }).toList(),
              ),

              // swapAnimationCurve: Curves.easeInBack,
              // swapAnimationDuration: const Duration(seconds: 10),
            ),
          ),
        ],
      ),
    );
  }
}
