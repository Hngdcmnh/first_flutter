import 'dart:ffi';

import 'package:first_project/model/BarData.dart';

import '../../model/Product.dart';

class DataOverview {
  List<BarData> getBarChartData(int index) {
    if (index == 1) {
      return [
        BarData(15),
        BarData(14),
        BarData(2.5),
        BarData(2.5),
        BarData(2),
        BarData(2),
        BarData(2.5),
        BarData(2.5),
        BarData(2.5),
        BarData(9),
        BarData(9),
        BarData(12),
        BarData(16),
      ];
    } else if (index == 2) {
      return [
        BarData(2.5),
        BarData(9),
        BarData(9),
        BarData(12),
        BarData(16),
        BarData(15),
        BarData(14),
        BarData(2.5),
        BarData(2.5),
        BarData(2),
        BarData(2),
        BarData(2.5),
        BarData(2.5),
      ];
    } else {
      return [
        BarData(2.5),
        BarData(9),
        BarData(14),
        BarData(2.5),
        BarData(2.5),
        BarData(2),
        BarData(2),
        BarData(2.5),
        BarData(2.5),
        BarData(9),
        BarData(12),
        BarData(16),
        BarData(15),
      ];
    }
  }

  List<Product> getListBestSellerProduct() {
    return [
      Product(stt: 1, name: 'Product 1', amount: 10, description: '7 bộ'),
      Product(stt: 2, name: 'Product 2', amount: 13, description: '8 bộ'),
      Product(stt:3,name: 'Product 3',amount: 11, description: '1 bộ'),
      Product(stt:4,name: 'Product 4',amount: 17, description: '4 bộ'),
      // Product(stt:5,name: 'Product 5',amount: 9, description: '4 bộ'),
    ];
  }

  List<OptionTime> getOptionTimes() {
    return [
      OptionTime(name: 'Tháng này'),
      OptionTime(name: 'Tháng trước'),
      OptionTime(name: 'Quý này'),
      OptionTime(name: 'Quý trước'),
      OptionTime(name: 'Quý 1'),
      OptionTime(name: 'Quý 2'),
      OptionTime(name: 'Quý 3'),
      OptionTime(name: 'Quý 4'),
      OptionTime(name: 'Năm nay'),
      OptionTime(name: 'Năm trước'),
    ];
  }

  List<InfoOverview> getInfoOverview() {
    return [
      const InfoOverview('Tổng tiền', -1500759.0, 1),
      const InfoOverview('    Tiền mặt', -7175009.0, 1),
      const InfoOverview('    Tiền gửi', 21500759.0, 1),
      const InfoOverview('Phải thu', -15759.0, 4),
      const InfoOverview('Phải trả', 81500759.0, 4),
      const InfoOverview('Doanh thu', 759.0, 1),
      const InfoOverview('Chi phí', -150079.0, 1),
      const InfoOverview('Lợi nhuận', -150079.0, 1),
      const InfoOverview('Hàng tồn kho', -159.0, 3),
    ];
  }
}

class InfoOverview {
  final String title;
  final double value;
  final int type;

  const InfoOverview(this.title, this.value, this.type);
}

class OptionTime {
  final String name;

  OptionTime({required this.name});
}
