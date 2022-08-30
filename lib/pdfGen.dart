import 'dart:io';

import 'package:invoice_app/shopScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void pdfGen(DataModel d1) async {
  var pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      orientation: pw.PageOrientation.portrait,
      margin: pw.EdgeInsets.all(10),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          alignment: pw.Alignment.center,
          child: pw.Container(
            width: 300,
            padding: pw.EdgeInsets.all(10),
            height: 600,
            color: PdfColors.white,
            child: pw.Column(
              children: [
                pw.SizedBox(
                  height: 100,
                  child: pw.Container(),
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                  "Fri, August 26, 2022, Time: 9:42 PM",
                  style: pw.TextStyle(fontSize: 10),
                ),
                pw.SizedBox(height: 20),
                pw.Container(
                  height: 50,
                  width: 300,
                  child: pw.Text(
                    "0000-1111-2222-3333-44444",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                    "---------------------------------------------------------------------------------"),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Customer Name   :",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "${d1.name}",
                      style: pw.TextStyle(color: PdfColors.black),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Contact No.   :",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "${d1.number}",
                      style: pw.TextStyle(color: PdfColors.black),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Payment Method   :",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "${d1.payment}",
                      style: pw.TextStyle(color: PdfColors.black),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      "Address   :",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "${d1.address}",
                      style: pw.TextStyle(color: PdfColors.black),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Text(
                    "---------------------------------------------------------------------------------"),
                pw.SizedBox(height: 10),
                pw.Expanded(
                  child: pw.ListView.builder(
                      itemCount: d1.data!.length,
                      itemBuilder: (context, index) {
                        return pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text("${d1.data![index].pname}"),
                            pw.Text("${d1.data![index].qty}"),
                            pw.Text("${d1.data![index].dis}"),
                            pw.Text("\u20B9${d1.data![index].price}"),
                          ],
                        );
                      }),
                ),
                pw.Stack(
                  children: [
                    pw.Align(
                      child: pw.Container(
                        child: pw.Text("Amount : \u20B9${bilamount}",style: pw.TextStyle(fontWeight: pw.FontWeight.bold,fontSize: 20),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
  Directory? dir = await getExternalStorageDirectory();
  print(
      "==================== ${dir!.path}==============================================================================");
  File file = File("${dir.path}/flutter.pdf");
  file.writeAsBytes(await pdf.save());
}
