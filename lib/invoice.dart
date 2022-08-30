import 'package:flutter/material.dart';
import 'package:invoice_app/pdfGen.dart';
import 'package:invoice_app/shopScreen.dart';

class invoice extends StatefulWidget {
  const invoice({Key? key}) : super(key: key);

  @override
  State<invoice> createState() => _invoiceState();
}

class _invoiceState extends State<invoice> {
  @override
  Widget build(BuildContext context) {
    DataModel d1 = ModalRoute.of(context)!.settings.arguments as DataModel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Invoice"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              pdfGen(d1);
            }, icon: Icon(Icons.download)),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            width: 300,
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Container(
                    child: Image.asset("assets/images/logo.jpg"),
                  ),
                ),
                Text(
                  "Fri, August 26, 2022, Time: 9:42 PM",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 20),
                Card(
                  child: Container(
                    height: 50,
                    width: 300,
                    child: Center(
                      child: Text(
                        "0000-1111-2222-3333-44444",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("---------------------------------------------------------------------------------"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Customer Name   :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${d1.name}",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contact No.   :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${d1.number}",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method   :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${d1.payment}",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address   :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${d1.address}",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("---------------------------------------------------------------------------------"),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                      itemCount: d1.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${d1.data![index].pname}"),
                          leading: Text("Quantity: ${d1.data![index].qty}"),
                          subtitle: Text("Discount: ${d1.data![index].dis}"),
                          trailing: Text("\u20B9 ${d1.data![index].price}"),
                        );
                        // Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                        // Text("${d1.data![0].pname}"),
                        // ],
                        // ),
                      }),
                ),
                SizedBox(height: 20),
                Text("---------------------------------------------------------------------------------"),
                Stack(
                  children: [
                    Align(
                      child: Container(
                        child: ListTile(
                          trailing: Text("Amount : \u20B9${bilamount}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ),
                    ),
                  ],
                ),
                Text("---------------------------------------------------------------------------------"),
                Text("------------  THANKS FOR VISIT THIS SHOP  --------------"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
