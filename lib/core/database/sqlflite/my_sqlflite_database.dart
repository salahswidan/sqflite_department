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
  sqfliteDataBase.Database? _db;

  Future<sqfliteDataBase.Database> _initDatabase() async {
    String databasePath = await sqfliteDataBase.getDatabasesPath();
    String managamentDataBaseName = 'managament.db';
    String realDatabasePath = join(databasePath, managamentDataBaseName);
    int versionDataBase = 1;
    _db ??= await sqfliteDataBase.openDatabase(realDatabasePath,
        onCreate: _onCreate, version: versionDataBase);
    return _db!;
  }

  _onCreate(sqfliteDataBase.Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $_userTable ($_userColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_userColumnUserName TEXT);');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $_productTable ($_productColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_productColumnName TEXT ,$_productColumnPrice REAL, $_productColumnCount INTEGER);');
    await db.execute(
        'CREATE TABLE  IF NOT EXISTS $_salesTable ($_salesColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_salesColumnProductName TEXT ,$_salesColumnUserName TEXT);');
  }

  @override
  Future<bool> delete() async {
    await _initDatabase();
    int deleted = await _db!.delete(_userTable, where: '$_userColumnID == 2');
    await _db!.close();
    return deleted > 0 ? true : false;
  }

  Future<bool> insertToUserTable({required String userName}) async {
    return insert(tableName: _userTable, values: {
      _userColumnUserName: userName,
    });
  }

  Future<bool> insertToProductTable(
      {required String name, required double price, required int count}) async {
    return insert(tableName: _productTable, values: {
      _productColumnName: name,
      _productColumnPrice: price,
      _productColumnCount: count,
    });
  }

  @override
  Future<bool> insert(
      {required String tableName, required Map<String, Object?> values}) async {
    // TODO: implement insert
    await _initDatabase();
    int inserted = await _db!.insert(tableName, values);
    await _db!.close();
    return inserted > 0 ? true : false;
  }

  @override
  Future<List<Map<String, Object?>>> selectUserTableData() async {
    return select(tableName: _userTable);
  }
  Future<List<Map<String, Object?>>> selectProductTableData() async {
    return select(tableName: _productTable);
  }

  Future<List<Map<String, Object?>>> select({required String tableName}) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query(_userTable);
    await _db!.close();
    return data;
  }

  @override
  Future<bool> update() async {
    await _initDatabase();
    int updated = await _db!.update(
      _userTable,
      {},
    );
    await _db!.close();
    return updated > 0 ? true : false;
  }
}
