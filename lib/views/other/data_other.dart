import 'package:flutter/material.dart';

class DataOther {
  List<Other> getOthers() {
      return [
        Other(icon: Icons.star,title: 'Đánh giá ứng dụng'),
        Other(icon: Icons.info,title: 'Thông tin sản phẩm'),
        Other(icon: Icons.settings,title: 'Thiết lập'),
        Other(icon: Icons.login_outlined,title: 'Đăng xuất'),
      ];
  }
}

class Other{
  final IconData icon;
  final String title;

  Other({required this.icon, required this.title});
}