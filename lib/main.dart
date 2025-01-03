import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sqfliteDataBase;
import 'package:path/path.dart';
import 'package:sqflite_department/view/user_screen.dart';

void main() async {
 // WidgetsFlutterBinding.ensureInitialized();
  //! get database in your app
  //String databasePath = await sqfliteDataBase.getDatabasesPath();

  //! make your database name (add this name to your path database)
//   String myDbName = 'test2.db';
//   String myDbPath = join(databasePath, myDbName);

//   //! open database (create database)
//   // bool isExcited = await sqfliteDataBase.databaseExists(myDbPath);
//   // if (isExcited == true) {
//   //   sqfliteDataBase.deleteDatabase(myDbPath);
//   // }
//   int versionDb = 1;
//   sqfliteDataBase.Database myDatabase = await sqfliteDataBase.openDatabase(
//     myDbPath,
//     version: versionDb,
//     onCreate: (db, int version) async {
//       // BLOB   // INTEGER == BOOL(0,1)     // REAL       // NULL       // TEXT
//       await db.execute(
//         'CREATE TABLE user (id INTEGER, name TEXT,salary REAL);',
//       );
//       await db.execute(
//         'CREATE TABLE groups (id INTEGER, name TEXT ,count INTEGER);',
//       );
//       await db.execute(
//         'CREATE TABLE IF NOT EXISTS groups (id INTEGER, name TEXT ,count INTEGER);',
//       );

//       print(db);
//       print(version);
//     },
//   );
//   //! delete data
//   //  myDatabase.rawDelete("DELETE FROM user WHERE id = 1");
//   // myDatabase.delete("user", where: "id = 2");
// //myDatabase.execute("DELETE FROM user WHERE id = 3");
//   //! select data
//   List<Map<String, Object?>> data =
//       await myDatabase.rawQuery("SELECT * FROM user");
//   print(data);
//   //! update data
//   // int updated =
//   //     await myDatabase.rawUpdate("UPDATE user SET salary = 12000 where id =3 ");
// //  int updated2 = await myDatabase.update("user", {'salary': 16000}, where: "id = 2");
// //   print(updated2);
//   //myDatabase.execute("UPDATE user SET salary = 70532500 where id =1");
//   //! insert data
//   // for (int i = 1; i < 4; i++) {
//   //   await myDatabase.insert(
//   //     'user',
//   //     {'id': i, 'name': 'salah+$i', 'salary': 1000 + i},
//   //   );
//   // }
//   // List<Map<String, Object?>> data2 = await myDatabase.query("user",where: "name like '%salah%'");
//   // print(data2);

//   // await myDatabase.transaction((txn) async {
//   //   int i = await txn.rawInsert("INSERT INTO user VALUES (1, 'Ammar', 1000)");
//   //   print(i);
//   // });
//   //! close database
//   // await myDatabase.insert("user", {'id':1, 'name':'Ammar', });
//   // await myDatabase.execute("DROP TABLE IF EXISTS testtable");
//   // await myDatabase.execute("INSERT INTO user VALUES (1, 'Ammar', 1000)");
//   await myDatabase.close();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            home: UserScreen(),
    );
  }
}
