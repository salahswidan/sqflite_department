import 'package:flutter/material.dart';
import 'package:sqflite_department/view/product_screen.dart';
import 'package:sqflite_department/view/user_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserScreen()));
                  },
                  child: Text("User Screen")),
              ElevatedButton(onPressed: () {
                  Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductScreen()));
              }, child: Text("Product Screen")),
              ElevatedButton(onPressed: () {}, child: Text("Sales Screen")),
            ],
          ),
        ),
      ),
    );
  }
}
