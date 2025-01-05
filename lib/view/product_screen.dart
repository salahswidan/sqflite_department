import 'package:flutter/material.dart';
import 'package:sqflite_department/controlller/product_controller.dart';
import 'package:sqflite_department/controlller/user_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<ProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productdEditController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productCountController = TextEditingController();
  late ProductController _productController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productController = ProductController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _productNameController,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _productPriceController,
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _productCountController,
                decoration: InputDecoration(
                  labelText: "Count",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    _productController.insertProduct(
                        name: _productNameController.text,
                        price: double.parse(_productPriceController.text),
                        count: int.parse(_productCountController.text));
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
                            //  int id
                            // = _productController.dataUser[index]["user_id"];
                            // _productdEditController.text =
                            //     _productController.dataUser[index]["username"];
                            //   showModalBottomSheet(
                            //       context: context,
                            //       builder: (context) => Container(
                            //             padding: EdgeInsets.all(20),
                            //             child: Column(
                            //               children: [
                            //                 TextField(
                            //                   controller: _productdEditController,
                            //                   decoration: InputDecoration(
                            //                     labelText: "User Name",
                            //                     border: OutlineInputBorder(),
                            //                   ),
                            //                 ),
                            //                 Row(
                            //                   children: [
                            //                     ElevatedButton(
                            //                         onPressed: () async {
                            //                           _productController.updateUser(
                            //                               userName:
                            //                                   _productdEditController
                            //                                       .text,
                            //                               id: id);
                            //                           Navigator.of(context).pop;
                            //                           setState(() {});
                            //                         },
                            //                         child: Text("update")),
                            //                     ElevatedButton(
                            //                         onPressed: () async {
                            //                           _productController.deleteUser(
                            //                               id: id);
                            //                           Navigator.of(context).pop;
                            //                           setState(() {});
                            //                         },
                            //                         child: Text("delete")),
                            //                   ],
                            //                 )
                            //               ],
                            //             ),
                            //           ));
                          },
                          child: Row(
                            children: [
                              Text(
                                  " id : ${_productController.dataProduct[index]['product_id']}"),
                              Text(
                                  " name : ${_productController.dataProduct[index]['product_name']}"),
                              Text(
                                  " price : ${_productController.dataProduct[index]['product_price']}"),
                              Text(
                                  " count : ${_productController.dataProduct[index]['product_count']}"),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: _productController.dataProduct.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
