import 'package:flutter/material.dart';
import 'package:sqflite_department/controlller/user_controller.dart';

import '../core/database/sqlflite/my_sqlflite_database.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _usernameController = TextEditingController();
  late UserController _userController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userController = UserController();
  }
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
            },
             child: Text("inserted")),
           
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index)=> Row(
                children: [
                
                  Text(_userController.dataUser[index].toString()),
                ],
              ), separatorBuilder: (context, index)=> SizedBox(height: 10,), itemCount:_userController.dataUser.length),
            ),],
        ),
      ),
    );
  }
}