class Students {
  // Property : id integer primary key autoincrement, code text, name text, dept text, phone texxt
  int? id; // Auto Increment
  String code;
  String name;
  String dept;
  String phone;

  // Constructor
  Students(
    {
      this.id,
      required this.code,
      required this.name,
      required this.dept,
      required this.phone,
    }
  );

  // Factory
  Students.fromMap(Map<String, dynamic> res)
  : id = res['id'],
  code = res['code'], 
  name = res['name'], 
  dept = res['dept'], 
  phone = res['phone'];

    // factory Students.fromMap(Map<String, dynamic> res){
    //   return Students(
    //     id: res['id'],
    //     code: res['code'],
    //     name: res['name'],
    //     dept: res['dept'],
    //     phone: res['phone']);
    // }
}