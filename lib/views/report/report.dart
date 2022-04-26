import 'package:first_project/views/report/data_report.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  static String id ='/ReportPage';

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final List<Report> _reportItems = DataReport().getReportItems();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Báo cáo'),
      ),
      body: Stack(
        children: [
          Container(color: Colors.black12),
          Container(child: ListView.builder(
            shrinkWrap: true,
            itemCount: _reportItems.length,
            itemBuilder: (context, index) {
              return ReportItem(
                report: _reportItems[index],
              );
            },
          ),)
        ],
      ),
    );
  }
}

class ReportItem extends StatelessWidget {
  const ReportItem({Key? key, required this.report}) : super(key: key);
  final Report report;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(report.icon, color: Colors.green,),
                Container(margin: EdgeInsets.only(left: 8),child: Text(report.title))
              ],
            ),
          ),

          Container(
            color: Colors.black12,
            height: 1,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

