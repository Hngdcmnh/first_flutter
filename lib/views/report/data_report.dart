import 'package:flutter/material.dart';

class DataReport{
  List<Report> getReportItems() {
    return [
      Report(icon: Icons.supervised_user_circle, title: 'Công nợ khách hàng'),
      Report(icon: Icons.car_repair, title: 'Công nợ nhà cung cấp'),
      Report(icon: Icons.person, title: 'Công nợ nhân viên'),
      Report(icon: Icons.home_filled, title: 'Tồn kho'),

    ];
  }
}
class Report{
  final IconData icon;
  final String title;

  Report({required this.icon, required this.title});
}