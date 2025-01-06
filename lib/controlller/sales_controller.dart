import '../core/database/sqlflite/my_sqlflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProducts = [];
  int? valueButtonUsers;
  int valueButtonProducts = 0;

  SalesController() {
    init();
  }
  void init() async {
    await selectUsers();
    valueButtonUsers = dataUser[0]["user_id"];
    await selectProducts();
  }

  Future<void> selectUsers() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.selectUserTableData();
  }

  Future<void> insertToSales() async {
    String userName = "";
    String productName = "";
    if (valueButtonUsers != null) {
      for (int i = 0; i < dataUser.length; i++) {
        if (dataUser[i]["user_id"] == valueButtonUsers) {
          userName = dataUser[i]["username"];
        }
      }
      for (int i = 0; i < dataProducts.length; i++) {
        if (dataProducts[i]["product_id"] == valueButtonProducts) {
          productName = dataProducts[i]["product_name"];
        }
      }

      MySqlFliteDatabase db = MySqlFliteDatabase();
      bool inserted = await db.insertToSalesTable(
          productName: productName, userName: userName);
      print(inserted);
    }
  }

  Future<void> selectProducts() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataProducts = await db.selectProductTableData();
    valueButtonProducts = dataProducts[0]["product_id"];
  }
}
