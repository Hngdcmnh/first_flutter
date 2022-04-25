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
    return [Product(name: 'Product 1')];
  }
}
