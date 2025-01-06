import '../core/database/sqlflite/my_sqlflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProducts = [];
  int valueButtonUsers = 0;
  int valueButtonProducts = 0;

  SalesController() {
    selectUsers();
    selectProducts();
  }

  Future<void> selectUsers() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.selectUserTableData();
    valueButtonUsers = dataUser[0]["user_id"];
  }

  Future<void> selectProducts() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataProducts = await db.selectProductTableData();
    valueButtonProducts = dataProducts[0]["product_id"];
  }
}
