import '../core/database/sqlflite/my_sqlflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProducts = [];
  List dataSales = [];
  int? valueButtonUsers;
  int? valueButtonProducts;

  SalesController() {
    init();
  }
  void init() async {
    await selectUsers();
    if (dataUser.isNotEmpty) valueButtonUsers = dataUser[0]["user_id"];
    await selectProducts();
    if (dataProducts.isNotEmpty)
      valueButtonProducts = dataProducts[0]["product_id"];
  }

  Future<void> selectUsers() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.selectUserTableData();
  }

  Future<void> insertToSales() async {
    if (valueButtonUsers != null && valueButtonProducts != null) {
      MySqlFliteDatabase db = MySqlFliteDatabase();
      bool inserted = await db.insertToSalesTable(
          productID: valueButtonProducts!, userID: valueButtonUsers!);
      print(inserted);
    }
  }

  Future<void> selectProducts() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataProducts = await db.selectProductTableData();
  }

  Future<void> selectSales() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataSales = await db.selectSalesTableData();
    // dataSales = await db.selectSales();
    print(dataSales);
  }
}
