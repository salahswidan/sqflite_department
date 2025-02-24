import 'package:flutter/material.dart';
import 'package:sqflite_department/controlller/sales_controller.dart';
import 'package:sqflite_department/core/database/sqlflite/my_sqlflite_database.dart';

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
                        value: _salesController.valueButtonUsers,
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
                        onChanged: (value) {
                          _salesController.valueButtonUsers =
                              int.parse(value.toString());
                          setState(() {});
                        })
                  ],
                ),
                Row(
                  children: [
                    Text("Product"),
                    SizedBox(
                      width: 100,
                    ),
                    DropdownButton(
                        value: _salesController.valueButtonProducts,
                        items: [
                          for (int i = 0;
                              i < _salesController.dataProducts.length;
                              i++)
                            DropdownMenuItem(
                              value: _salesController.dataProducts[i]
                                  ["product_id"],
                              child: Text(
                                  "${_salesController.dataProducts[i]["product_name"]} / ${_salesController.dataProducts[i]["product_price"].toString()}"),
                            ),
                        ],
                        onChanged: (value) {
                          _salesController.valueButtonProducts =
                              int.parse(value.toString());
                          setState(() {});
                        })
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("refrash")),
                    ElevatedButton(
                        onPressed: () {
                          _salesController.insertToSales();
                          _salesController.selectSales();
                          setState(() {});
                        },
                        child: Text("Add")),
                    ElevatedButton(
                        onPressed: () async {
                          MySqlFliteDatabase db = MySqlFliteDatabase();
                          var a = await db.sales();
                          print(a.length);
                          setState(() {});
                        },
                        child: Text("sales")),
                    ElevatedButton(
                        onPressed: () {
                          _salesController.selectSales();
                        },
                        child: Text("get data")),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                            child: Row(
                              children: [
                                Text(
                                    "user : ${_salesController.dataSales[index]["username"]}  "),
                                Text(
                                    "product : ${_salesController.dataSales[index]["product_name"]}"),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: _salesController.dataSales.length),
                ),
              ],
            ),
          ),
        ));
  }
}
