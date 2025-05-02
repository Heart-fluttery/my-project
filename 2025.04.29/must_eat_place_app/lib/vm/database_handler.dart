/*
2025.04.29 이학현
DataBase Handler
query, insert, update, update all, delete
*/
import 'package:must_eat_place_app/model/eat_place.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'eat_place.db'),
      onCreate: (db, version) async{
        await db.execute(
          "create table eat_place(id integer primary key autoincrement, latitude real, longitude real, name text, tel text, score integer, review text, image blob)"
        );
      },
      version: 1
    );
  }

  // 데이터베이스에서 EatPlace 데이터를 읽어오는 함수
  // 리스트를 return해서 타입이 List<모델>
  Future<List<EatPlace>> queryEatplace() async{

    // 데이터베이스 연결, initializDB는 DB를 열어주는 함수
    final Database db = await initializDB();

    // eat_place에 있는 모든 데이터 가져오기
    final List<Map<String, Object?>> queryResults = await db.rawQuery('select * from eat_place');

    // queryResults에 들어온 데이터를 하나하나(e) EatPlace.fromMap() 생성자를 써서
    // EatPlace 객체로 변환하고 .toList()로 모은다
    return queryResults.map((e) => EatPlace.fromMap(e)).toList();
  }

  Future<int> insertEatPlace(EatPlace eatplace) async{
    int result = 0;
    final Database db = await initializDB();
    // rawInsert = 새 레코드(행 Column) 삽입
    // db.rawInsert(...)는 Primary 키를 반환해서 숫자(만들어진 순서)가 반환됨
    result = await db.rawInsert(
      'insert into eat_place(latitude, longitude, name, tel, score, review, image) values (?,?,?,?,?,?,?)',
      [eatplace.latitude, eatplace.longitude, eatplace.name, eatplace.tel, eatplace.score, eatplace.review, eatplace.image]
    );
    return result;
  }

  Future<int> updateEatPlace(EatPlace eatplace) async{
    int result = 0;
    final Database db = await initializDB();
    result = await db.rawUpdate(
      'update eat_place set latitude = ?, longitude = ?, name = ?, tel = ?, score = ?, review = ? where id = ?',
      [eatplace.latitude, eatplace.longitude, eatplace.name, eatplace.tel, eatplace.score, eatplace.review, eatplace.id]
    );
    return result;
  }
  
  Future<int> updateEatPlaceAll(EatPlace eatplace) async{
    int result = 0;
    final Database db = await initializDB();
    result = await db.rawUpdate(
      'update eat_place set latitude = ?, longitude = ?, name = ?, tel = ?, score = ?, review = ?, image = ? where id = ?',
      [eatplace.latitude, eatplace.longitude, eatplace.name, eatplace.tel, eatplace.score, eatplace.review, eatplace.image, eatplace.id]
    );
    return result;
  }

  Future<void> deleteEatPlace(int id) async{
    final Database db = await initializDB();
    await db.rawDelete('delete from eat_place where id = ?', [id]);
  }
}