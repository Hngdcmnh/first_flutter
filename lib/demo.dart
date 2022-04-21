
import 'package:flutter/material.dart';

import 'model/Company.dart';
import 'overview.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  static String id = '/DemoPage';

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Chọn công ty làm việc'),
      ),
      body: ListCompany(),
    );
  }
}

class ListCompany extends StatefulWidget {
  const ListCompany({Key? key}) : super(key: key);

  @override
  State<ListCompany> createState() => _ListCompanyState();
}

class _ListCompanyState extends State<ListCompany> {
  final List<Company> _companies = [];
  final List<Company> _searchCompanies = [];
  final TextEditingController _controllerSearchText = TextEditingController();
  int selectedIndex = -1;

  @override
  void initState() {
    setCompanies();
    setSearchCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(fontSize: 20),
              controller: _controllerSearchText,
              onChanged: (value) {
                setState(() {
                    getShowList(value);
                });
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  fillColor: Colors.black12,
                  filled: true,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _controllerSearchText.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: _clearTextField,
                          icon: Icon(Icons.clear_rounded))),
            ),
          ),
          Material(
            color: Colors.black12,
            child: SizedBox(
              height: 6,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _searchCompanies.length,
              itemBuilder: (context, index) {
                return CompanyItem(
                  company: _searchCompanies[index],
                  selected: index == selectedIndex,
                  onClick: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OverviewPage.id,arguments: _companies[selectedIndex]);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, minimumSize: Size.fromHeight(48)),
                child: Text(
                  'Xác nhận',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }

  void setCompanies() {
    for (var i = 0; i <= 10; i++) {
      addCompany(i.toString() + "abcdefghik" + i.toString());
    }
  }

  void addCompany(String text) {
    var company = Company(
      name: text,
    );
    _companies.add(company);
  }

  void _clearTextField() {
    // Clear everything in the text field
    _controllerSearchText.clear();
    // Call setState to update the UI
    setState(() {});
  }

  void getShowList(String value) {
    _searchCompanies.clear();
    for(var company in _companies)
      {
        if(company.name.contains(value))
          {
            _searchCompanies.add(company);
          }
      }

  }

  void setSearchCompanies() {
    _searchCompanies.addAll(_companies);
  }
}



class CompanyItem extends StatelessWidget {
  const CompanyItem(
      {Key? key,
      required this.company,
      required this.selected,
      required this.onClick})
      : super(key: key);
  final Company company;
  final bool selected;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                          child: Text(
                            company.name[0].toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selected ? Colors.green : Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        company.name.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selected ? Colors.green : Colors.black),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: selected,
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )),
                ),
              ],
            ),
          ),
          Divider(
            height: 4,
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}
