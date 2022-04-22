class Company {
  int id;
  final String name;

  Company({required this.name, required this.id});

  @override
  bool operator ==(a) => a is Company && a.id == id;

  Map<String, dynamic> toMapWithoutId() {
    final map = new Map<String, dynamic>();
    map["name"] = name;
    return map;
  }

  //to be used when updating a row in the table
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;

    return map;
  }

  //to be used when converting the row into object
  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(name: map['name'], id: map['id']);
  }
}
