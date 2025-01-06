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
  TextEditingController _usernameEditController = TextEditingController();
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
      appBar: AppBar(title: Text("user screen"),),
      body: SafeArea(
        child: Padding(
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
              ElevatedButton(
                  onPressed: () async {
                    _userController.insertUser(
                        userName: _usernameController.text);
                    setState(() {});
                  },
                  child: Text("inserted")),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {});
                  },
                  child: Text("refresh")),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            int id = _userController.dataUser[index]["user_id"];
                            _usernameEditController.text =
                                _userController.dataUser[index]["username"];
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: _usernameEditController,
                                            decoration: InputDecoration(
                                              labelText: "User Name",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    _userController.updateUser(
                                                        userName:
                                                            _usernameEditController
                                                                .text,
                                                        id: id);
                                                    Navigator.of(context).pop;
                                                    setState(() {});
                                                  },
                                                  child: Text("update")),
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    _userController.deleteUser(
                                                        id: id);
                                                    Navigator.of(context).pop;
                                                    setState(() {});
                                                  },
                                                  child: Text("delete")),
                                            ],
                                          )
                                        ],
                                      ),
                                    ));
                          },
                          child: Row(
                            children: [
                              Text(
                                  "id : ${_userController.dataUser[index]["user_id"]}     "),
                              Text(
                                  "name : ${_userController.dataUser[index]["username"]}"),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: _userController.dataUser.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
