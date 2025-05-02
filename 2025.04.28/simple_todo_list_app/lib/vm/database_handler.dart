import 'package:path/path.dart';
import 'package:simple_todo_list_app/model/todolist.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'todolist.db'),
      onCreate: (db, version) async{
        await db.execute(
          "create table todolist (id integer primary key autoincrement, todo text, date text)"
        );
        await db.execute(
          "create table delete_lists (id integer primary key autoincrement, todo text, date text)"
        );
      },
      version: 1
    );
  }

  Future<List<Todolist>> queryTodolist() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResults = await db.rawQuery('select * from todolist');
    return queryResults.map((e) => Todolist.fromMap(e)).toList();
  }
  Future<List<Todolist>> querydelTodolist() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResults = await db.rawQuery('select * from delete_lists');
    return queryResults.map((e) => Todolist.fromMap(e)).toList();
  }

  Future<int> insertTodolist(Todolist todolist) async{
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert('insert into todolist(todo, date) values (?,?)',
            [todolist.todo, todolist.date]
    );
    print("Insert return value : $result");
    return result;
  }

    Future<int> updateTodolist(Todolist todolist) async{
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawUpdate('update todolist set todo=?, date=? where id=?',
            [todolist.todo, todolist.date, todolist.id]
    );
    print("update return value : $result");
    return result;
    }

    Future<void> deleteTodolist(int index) async{
      final Database db = await initializeDB();
      await db.rawDelete('delete from delete_lists where id = ?',
            [index]
    );
    }

    Future<void> moveTodoToDeleteList(int id) async{
      final Database db = await initializeDB();

      // 1. id에 해당하는 데이터 가져오기
      final List<Map<String, Object?>> result = await db.query(
        'todolist',
        where: 'id = ?',
        whereArgs: [id]
      );

  if (result.isNotEmpty) {
    final todo = result[0]['todo'] as String;
    final date = result[0]['date'] as String;

    // 2. delete_lists에 추가
    await db.insert(
      'delete_lists',
      {
        'todo': todo,
        'date': date,
      },
    );

    // 3. todolist에서 삭제
    await db.delete(
      'todolist',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
    }


}