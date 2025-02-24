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
    dataProduct = await db.selectProductTableData();

    // print(dataUser);
  }

  void updateProduct({required String productName, required int id ,required double productPrice, required int productCount}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    await db.updateProductTable(productName: productName,productPrice: productPrice, productCount: productCount, id: id);
  }

  void deleteProduct({required int id}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    await db.deleteProductTable(id: id);
  }
}
