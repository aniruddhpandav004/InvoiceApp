import 'package:flutter/material.dart';
import 'package:invoice_app/invoice.dart';
import 'package:invoice_app/shopScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => shopScreen(),
        'invoice' : (context) => invoice(),
      },
    ),
  );
}
