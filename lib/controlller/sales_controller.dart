import '../core/database/sqlflite/my_sqlflite_database.dart';

class SalesController {
  List dataUser = [];
  List dataProducts = [];
  int? valueButtonUsers;
  int valueButtonProducts = 0;

  SalesController() {
    init();
  }
  void init()async{
       await selectUsers();
    valueButtonUsers = dataUser[0]["user_id"];
   await selectProducts();
  }

  Future<void> selectUsers() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.selectUserTableData();
    
  }

  Future<void> selectProducts() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataProducts = await db.selectProductTableData();
    valueButtonProducts = dataProducts[0]["product_id"];
  }
}
