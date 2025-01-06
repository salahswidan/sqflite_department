import '../core/database/sqlflite/my_sqlflite_database.dart';

class SalesController {
  List dataUser = [];
      int valueButton = 0;

  SalesController() {
    selectUsers();
  }

  Future<void> selectUsers() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.selectUserTableData();
    valueButton = dataUser[0]["user_id"];

  }
}
