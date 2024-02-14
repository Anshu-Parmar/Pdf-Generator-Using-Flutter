import 'package:flutter/material.dart';
import 'package:pdf_export/screen/user_details_screen.dart';

import '../utils/pdf_data_modal.dart';

class PdfMainScreen extends StatelessWidget {
  const PdfMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: ListView(
        children: [
          ...invoices.map(
                (e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.customer),
              trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DetailPage(invoice: e),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
