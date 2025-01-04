import 'package:flutter/material.dart';

import '../core/database/sqlflite/my_sqlflite_database.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "User Name",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: ()async{
              
 MySqlFliteDatabase db =MySqlFliteDatabase();
 bool inserted = await db.insertToUserTable(userName: _usernameController.text);
 print(inserted);
            }, child: Text("inserted"))
          ],
        ),
      ),
    );
  }
}
