import 'package:sqflite_department/core/database/sqlflite/crud.dart';
import 'package:sqflite/sqflite.dart' as sqfliteDataBase;
import 'package:path/path.dart';

class MySqlFliteDatabase extends Crud {
  initDatabase() async {
    String databasePath = await sqfliteDataBase.getDatabasesPath();
    String managamentDataBaseName = 'managament.db';
    String realDatabasePath = join(databasePath, managamentDataBaseName);
    int versionDataBase = 1;
    sqfliteDataBase.openDatabase(realDatabasePath ,onCreate: (db, version) {
      version = versionDataBase;
      
      
    },);
  }

  @override
  int delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  int insert() {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  int select() {
    // TODO: implement select
    throw UnimplementedError();
  }

  @override
  int update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
