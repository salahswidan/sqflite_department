import '../core/database/sqlflite/my_sqlflite_database.dart';

class ProductController {
  List dataProduct = [];
  ProductController() {
    select();
  }
  void insertProduct(
      {required String name, required double price, required int count}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    bool a =
        await db.insertToProductTable(name: name, price: price, count: count);
    print(a);
    select();
  }

  void select() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataProduct = await db.selectUserTableData();

    // print(dataUser);
  }

  void updateUser({required String userName, required int id}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    await db.updateUserTable(userName: userName, id: id);
  }

  void deleteUser({required int id}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    await db.deleteUserTable(id: id);
  }
}
