import 'package:sqflite_department/core/database/sqlflite/crud.dart';
import 'package:sqflite/sqflite.dart' as sqfliteDataBase;
import 'package:path/path.dart';

class MySqlFliteDatabase extends Crud {
  final String _userTable = 'user';
  final String _userColumnID = 'user_id';
  final String _userColumnUserName = 'username';
  final String _productColumnID = 'product_id';
  final String _productColumnName = 'product_name';
  final String _productColumnPrice = 'product_price';
  final String _productColumnCount = 'product_count';
  final String _productTable = 'product';
  final String _salesTable = 'sales';
  final String _salesColumnID = 'sales_id';
  final String _salesColumnProductName = 'sales_product_name';
  final String _salesColumnUserName = 'sales_user_name';


  initDatabase() async {
    String databasePath = await sqfliteDataBase.getDatabasesPath();
    String managamentDataBaseName = 'managament.db';
    String realDatabasePath = join(databasePath, managamentDataBaseName);
    int versionDataBase = 1;
    sqfliteDataBase.openDatabase(realDatabasePath,
        onCreate: _onCreate, version: versionDataBase);
  }

  _onCreate(sqfliteDataBase.Database db, int version) async {
    await db.execute('CREATE TABLE $_userTable ($_userColumnID INTEGER, $_userColumnUserName TEXT);');
    await db.execute('CREATE TABLE $_productTable ($_productColumnID INTEGER, $_productColumnName TEXT ,$_productColumnPrice REAL, $_productColumnCount INTEGER);');
          await db.execute('CREATE TABLE $_salesTable ($_salesColumnID INTEGER, $_salesColumnProductName TEXT ,$_salesColumnUserName TEXT);');

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
