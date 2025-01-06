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
  final String _salesColumnProductID = 'sales_product_ID';
  final String _salesColumnUserID = 'sales_user_ID';
  sqfliteDataBase.Database? _db;

  Future<sqfliteDataBase.Database> _initDatabase() async {
    String databasePath = await sqfliteDataBase.getDatabasesPath();
    String managamentDataBaseName = 'managament.db';
    String realDatabasePath = join(databasePath, managamentDataBaseName);
    int versionDataBase = 2;
    _db ??= await sqfliteDataBase.openDatabase(realDatabasePath,
        onCreate: _onCreate, onUpgrade: (db, int oldVersion, int newVersion) {
      // print(db);
      // print(oldVersion);
      // print(newVersion);
    }, version: versionDataBase);
    return _db!;
  }

  _onCreate(sqfliteDataBase.Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $_userTable ($_userColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_userColumnUserName TEXT);');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $_productTable ($_productColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_productColumnName TEXT ,$_productColumnPrice REAL, $_productColumnCount INTEGER);');
    await db.execute(
        'CREATE TABLE  IF NOT EXISTS $_salesTable ($_salesColumnID INTEGER PRIMARY KEY AUTOINCREMENT, $_salesColumnProductID INTEGER ,$_salesColumnUserID INTEGER);');
  }

  @override
  Future<bool> delete(
      {required String tableName, required String where}) async {
    await _initDatabase();
    int deleted = await _db!.delete(tableName, where: where);
    await _db!.close();
    return deleted > 0 ? true : false;
  }

  Future<bool> deleteUserTable({required int id}) async {
    return delete(tableName: _userTable, where: '$_userColumnID == $id');
  }

  Future<bool> deleteProductTable({required int id}) async {
    return delete(tableName: _productTable, where: '$_productColumnID == $id');
  }

  Future<bool> insertToUserTable({required String userName}) async {
    return insert(tableName: _userTable, values: {
      _userColumnUserName: userName,
    });
  }

  Future<bool> insertToSalesTable(
      {required int userID, required int productID}) async {
    return insert(tableName: _salesTable, values: {
      _salesColumnUserID: userID,
      _salesColumnProductID: productID,
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
    await _initDatabase();
    int inserted = await _db!.insert(tableName, values);
    await _db!.close();
    return inserted > 0 ? true : false;
  }

  Future<List<Map<String, Object?>>> selectUserTableData() async {
    return select(tableName: _userTable);
  }

  // Future<List<Map<String, Object?>>> selectSalesTableData() async {
  //   return select(tableName: _salesTable);
  // }

  Future<List<Map<String, Object?>>> selectProductTableData() async {
    return select(tableName: _productTable);
  }

  @override
  Future<List<Map<String, Object?>>> select({required String tableName}) async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.query(tableName);
    await _db!.close();
    return data;
  }

  Future<List<Map<String, Object?>>> selectSalesTableData() async {
    await _initDatabase();
    List<Map<String, Object?>> data = await _db!.rawQuery(
        "SELECT $_salesTable.$_salesColumnID,$_productTable.$_productColumnName,$_userTable.$_userColumnUserName FROM $_salesTable,$_userTable,$_productTable WHERE $_salesTable.$_salesColumnUserID = $_userTable.$_userColumnID AND $_salesTable.$_salesColumnProductID = $_productTable.$_productColumnID");
    await _db!.close();
    return data;
  }

  @override
  Future<bool> update(
      {required String tableName,
      required Map<String, Object?> values,
      required String where}) async {
    await _initDatabase();
    int updated = await _db!.update(tableName, values, where: where);
    await _db!.close();
    return updated > 0 ? true : false;
  }

  Future<bool> updateUserTable(
      {required String userName, required int id}) async {
    return update(
        tableName: _userTable,
        values: {_userColumnUserName: userName},
        where: "$_userColumnID == $id");
  }

  Future<bool> updateProductTable(
      {required String productName,
      required int id,
      required double productPrice,
      required int productCount}) async {
    return update(
        tableName: _productTable,
        values: {
          _productColumnName: productName,
          _productColumnPrice: productPrice,
          _productColumnCount: productCount
        },
        where: "$_productColumnID == $id");
  }
}
