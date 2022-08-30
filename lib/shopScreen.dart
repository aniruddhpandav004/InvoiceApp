import 'package:flutter/material.dart';

class shopScreen extends StatefulWidget {
  const shopScreen({Key? key}) : super(key: key);

  @override
  State<shopScreen> createState() => _shopScreenState();
}

int bilamount = 0;

class _shopScreenState extends State<shopScreen> {
  List<Productmodel> product = [];
  TextEditingController txtname = TextEditingController();
  TextEditingController txtqty = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtdis = TextEditingController();

  TextEditingController txtpname = TextEditingController();
  TextEditingController txtnumber = TextEditingController();
  TextEditingController txtpayment = TextEditingController();
  TextEditingController txtaddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                String name = txtpname.text;
                String number = txtnumber.text;
                String payment = txtpayment.text;
                String addrees = txtaddress.text;
                DataModel d1 = DataModel(
                  name: name,
                  number: number,
                  payment: payment,
                  address: addrees,
                  data: product,
                );
                Navigator.pushNamed(context, 'invoice', arguments: d1);
              },
              icon: Icon(Icons.check),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Image.asset("assets/images/1.webp"),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 730,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: txtpname,
                    decoration: InputDecoration(
                      labelText: "User Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtaddress,
                    decoration: InputDecoration(
                      labelText: "Address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtnumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Contact No",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtpayment,
                    decoration: InputDecoration(
                      labelText: "Payment Method",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: txtname,
                          decoration: InputDecoration(
                            labelText: "Product Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: txtqty,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Oty",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: txtprice,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Price",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: txtdis,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Discount",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Productmodel pro = Productmodel(
                        pname: txtname.text,
                        qty: txtqty.text,
                        price: txtprice.text,
                        dis: txtdis.text,
                      );
                      setState(() {
                        product.add(pro);
                        txtname = TextEditingController();
                        txtqty = TextEditingController();
                        txtprice = TextEditingController();
                        txtdis = TextEditingController();
                      });
                      total();
                    },
                    child: Text("ADD"),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              product.removeAt(index);
                            });
                          },
                          child: ListTile(
                            title: Text("${product[index].pname}"),
                            leading: Text("Quantity: ${product[index].qty}"),
                            subtitle: Text("Discount: ${product[index].dis}"),
                            trailing: Text("\u20B9 ${product[index].price}"),
                          ),
                        );
                      },
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        child: Container(
                          color: Colors.blueGrey,
                          child: ListTile(
                            trailing: Text("Amount : \u20B9 $bilamount"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "PLEASE FILL THE DETAILS AND CLICK THE TRUE BUTTON",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void total() {
    int totalamount = 0;
    int totaldis = 0;

    for (int i = 0; i < product.length; i++) {
      totalamount =
          int.parse(product[i].price!) * (int.parse(product[i].qty!)) +
              totalamount;
      totaldis = int.parse(product[i].dis!) + totaldis;
    }
    setState(() {
      bilamount = totalamount - totaldis;
    });
  }
}

class Productmodel {
  String? pname, qty, price, dis;

  Productmodel({this.pname, this.qty, this.price, this.dis});
}

class DataModel {
  String? name, number, payment, address;
  List<Productmodel>? data = [];

  DataModel({this.name, this.number, this.payment, this.address, this.data});
}
