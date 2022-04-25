import 'dart:developer';

import 'package:flutter/material.dart';
import '../data/database_company.dart';
import '../model/Company.dart';
import 'demo.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  static String id = '/AddPage';

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  var _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new company'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  hintText: 'Tên công ty',
                  border: OutlineInputBorder()),
              controller: _controllerName,
            ),
            ElevatedButton(
                onPressed: () {
                  if(_controllerName.text!=null)
                    {
                      _addNewCompany(_controllerName.text);
                    }


                  Navigator.pushNamed(context, DemoPage.id);
                },
                child: Text('Thêm'))
          ],
        ),
      ),
    );
  }

  Future<void> _addNewCompany(String name) async {
    var id = await _databaseHelper.lastId()+1;
    await _databaseHelper.insert(Company(id: id, name: name));
  }
}
