import 'package:first_project/model/Product.dart';
import 'package:first_project/views/overview/data_overview.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../model/BarData.dart';
import '../../model/Company.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  static String id = '/OverviewPage';

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage>
    with TickerProviderStateMixin {
  late TabController _tabControllerRevenue;
  late TabController _tabControllerBestSeller;
  var indexRevenueChart =0;

  late Key keyTab;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabControllerRevenue = TabController(length: 3, vsync: this);
    _tabControllerBestSeller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    keyTab = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text('Công ty'),
      ),
      body: Stack(
        children: [
          buildBackground(),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [buildRevenueChart(), buildBestSeller()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData generateBarGroup(
    int x,
    double value,
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

  Widget buildBackground() {
    return Column(
      children: [
        Container(height: 50, decoration: BoxDecoration(color: Colors.green)),
        Expanded(
            child: Container(
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.black12)))
      ],
    );
  }

  Widget buildRevenueChart() {
    return Card(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
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
            SizedBox(
              height: 300,
              child: DefaultTabController(
                initialIndex: 1,
                length: 3,
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(2),
                      child: TabBar(
                        onTap: (index){
                            setState(() {
                                indexRevenueChart = index;
                            });
                        },
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              'Doanh thu',
                              style: TextStyle(color: Colors.black38,fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Chi phí',
                              style: TextStyle(color: Colors.black38,fontSize: 12),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Lợi nhuận',
                              style: TextStyle(color: Colors.black38,fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: buildBarChart(indexRevenueChart),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AspectRatio buildBarChart(int index) {
    return AspectRatio(
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
                barGroups:
                    DataOverview().getBarChartData(index).asMap().entries.map((e) {
                  final index = e.key;
                  final data = e.value;
                  return generateBarGroup(index, data.value);
                }).toList(),
              ),
            ),
          );
  }

  Widget buildBestSeller() {
    return Card(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        padding: EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                height: 300,
                child: DefaultTabController(
                  initialIndex: 1,
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.all(2),
                        child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          tabs: <Widget>[
                            Tab(
                              child: Text(
                                'Doanh thu',
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Số lượng',
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Center(
                                // child: ListView.builder(
                                //   shrinkWrap: true,
                                //   itemCount: 3,
                                //   itemBuilder: (context, index) {
                                //
                                //   },
                                // ),
                                ),
                            Center(
                              child: Text("Số lượng",
                                  style: TextStyle(color: Colors.black38)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem(Product listBestSellerProduct,
      {Key? key, required this.num, required this.name})
      : super(key: key);
  final int num;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              num.toString(),
              style: TextStyle(color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
