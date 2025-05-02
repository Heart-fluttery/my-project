class Todolist {
  // Property
  int? id;
  String todo;
  String date;

  // Constructor
  Todolist(
    {
      this.id,
      required this.todo,
      required this.date,
    }
  );

  // Factory
  Todolist.fromMap(Map<String, dynamic> res)
  : id = res['id'],
  todo = res['todo'],
  date = res['date'];
}