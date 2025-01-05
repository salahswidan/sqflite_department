import '../core/database/sqlflite/my_sqlflite_database.dart';

class UserController {
  List dataUser = [];
  UserController() {
    select();
  }
  void insertUser({required String userName}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    await db.insertToUserTable(userName: userName);
    select();
  }

  void select() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.selectUserTableData();

    // print(dataUser);
  }

  void updateUser({required String userName, required int id}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    await db.updateUserTable(userName: userName, id: id);
  }
}
