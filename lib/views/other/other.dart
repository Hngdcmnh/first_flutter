import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'data_other.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  static String id = '/OtherPage';

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  final List<Other> _otherItems = DataOther().getOthers();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildHeader(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                  padding:
                      EdgeInsets.only(top: 22, bottom: 22, left: 16, right: 16),
                  child: Icon(
                    Icons.home_work_rounded,
                    color: Colors.green,
                  )),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Công ty TNHH Tùng Lâm',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    Text('MST: 0101243150-905',
                        style: TextStyle(color: Colors.black54))
                  ]),
            ],
          ),
          Icon(Icons.keyboard_arrow_right_outlined)
        ],
      ),
      Container(
        color: Colors.black12,
        height: 6,
        width: double.infinity,
      ),
      Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Demo phân phối'),
            Text(
              'Đổi dữ liệu',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      Container(
        color: Colors.black12,
        height: 6,
        width: double.infinity,
      ),
      const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.all(12), child: Text('CHỨC NĂNG KHÁC'))),
      Container(
        color: Colors.black12,
        height: 2,
        width: double.infinity,
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _otherItems.length,
        itemBuilder: (context, index) {
          return OtherItem(other: _otherItems[index]);
        },
      ),
      Expanded(
          child: Container(
        color: Colors.black12,
      ))
    ]);
  }

  Container buildHeader() {
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'PH',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Phạm Văn Hùng',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'msms@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class OtherItem extends StatelessWidget {
  const OtherItem({Key? key, required this.other}) : super(key: key);
  final Other other;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    other.icon,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(other.title),
          )
        ],
      ),
    );
  }
}
