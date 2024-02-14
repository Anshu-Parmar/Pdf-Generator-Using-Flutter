
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../utils/pdf_data_modal.dart';

Future<Uint8List> makePdf(Invoice invoice) async {
  final pdf = Document();
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/images/company_logo.jpg')).buffer.asUint8List());
  pdf.addPage(Page(build: (context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: PdfColors.black,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Receipt",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Image(imageLogo),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "${DateTime.now()}",
              ),
            ),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          //                   <--- left side
                          color: PdfColors.black,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          //                    <--- top side
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Shri/Smt./Ms./Mrs./Mr. ${invoice.customer}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          //                    <--- top side
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Address: ${invoice.address}"),
                    ),
                  )),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          //                    <--- top side
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("The Sum of Rs. ${invoice.totalCost()}"),
                    ),
                  )),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text("Cheque Details",
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  )),
            ]),

            // two division section
            Row(children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Amount Rs. ${invoice.totalCost()}"),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Four Thousand Eighty"),
                    ),
                  )),
            ]),

            // three division section
            Row(children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Cheque No."),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Date: 19/12/2023"),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Bank Name: ()"),
                    ),
                  )),
              // VerticalDivider(indent: 0, endIndent: 0, color: PdfColors.black),

            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Payment Mode: Cheque/DD",),
                    ),
                  )),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("Remarks: Amount Received Against id 1234",),
                    ),
                  )),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text("For Any Further Queries Contact 8866******",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ]),
            Row(children: [
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text("1.Any payment received is non-refundable.\n 2.This is a temporary acknowledgement till verification. Final verification can be done from client portal with user ID and password.\n 3.This receipt dosen't create or establish any right of title interest on plot / property.\n 4.If you do not agree from any above mentioned points, kindly inform us on abc@gmail.com.\n 5.In Case of any dispute, management decision will be final and binding.\n 6.Subjects to Ahmedabad jurisdiction.",
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  )),
            ]),

            Row(children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                          child: Container(
                              color: PdfColors.black,
                              height: 30,
                              width: 30
                          )
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: PdfColors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 30,
                        alignment: Alignment.bottomRight,
                        child: Text("Authorized Signatory"),
                      ),
                    ),
                  )),
            ]),
          ]),
        ));
  }));
  return pdf.save();
}

Widget PaddedText(
    final String text, {
      final TextAlign align = TextAlign.left,
    }) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
