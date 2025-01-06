import 'package:flutter/material.dart';
import 'package:sqflite_department/controlller/sales_controller.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  late SalesController _salesController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _salesController = SalesController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sales Screen"),
        ),
        body: FutureBuilder(
          future: _salesController.selectUsers(),
          builder: (context, snapshot) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("User"),
                    SizedBox(
                      width: 100,
                    ),
                    DropdownButton(
                        value: _salesController.valueButton,
                        items: [
                          for (int i = 0;
                              i < _salesController.dataUser.length;
                              i++)
                            DropdownMenuItem(
                              value: _salesController.dataUser[i]["user_id"],
                              child: Text(
                                  _salesController.dataUser[i]["username"]),
                            )
                        ],
                        onChanged: (value) {})
                  ],
                ),
                Row(
                  children: [
                    Text("Product"),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
