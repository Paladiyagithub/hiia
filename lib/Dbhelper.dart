import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelepr {
  Future<Database> getdattabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Contact.db');

    // / open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'create table datatable (ID integer primary key autoincrement , NAME text, NUMBER text)');
    });
    return database;
  }

  Future<void> insertdata(String name, String number, Database database) async {
    String insert =
        "insert into datatable  (NAME,NUMBER)  values('$name','$number')";

  int cnt = await  database.rawInsert(insert);

  print(cnt);
  }

  Future<List<Map>> viewdata(Database database) async {

    String selct = "select * from datatable";
  List<Map> list = await  database.rawQuery(selct);
    print("======$list");

    return list;
  }

  static Future<void> delete(Database database, int id)  async {

    String delete = "delete from datatable where ID = '$id'";

     int k= await database.rawDelete(delete);

     return Future.value();

  }



  Future<void> updatedata(String newname, String newnumber, int id, Database database) async {
    String  update =  "update datatable set NAME = '$newname', NUMBER = '$newnumber' where ID = '$id'";
  int aa = await database.rawUpdate(update);
  }


}
