import '../core/database/sqlflite/my_sqlflite_database.dart';

class UserController {
  List dataUser = [];
  UserController() {
    select();
  }
  void insertUser({required String userName}) async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    bool inserted = await db.insertToUserTable(userName: userName);
    select();
  }

  void select() async {
    MySqlFliteDatabase db = MySqlFliteDatabase();
    dataUser = await db.select();
    
   // print(dataUser);
  }
}
