import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfGenerator {
  void generatePdf(Map<String, dynamic> patientData) async {
    final pdf = pw.Document();

    final imageData = await rootBundle.load("assets/images/Logo1.png");
    final logoImage = pw.MemoryImage(imageData.buffer.asUint8List());

    final bgImageData = await rootBundle.load("assets/images/watermark.png");
    final backgroundImage = pw.MemoryImage(bgImageData.buffer.asUint8List());
    final signImageData = await rootBundle.load("assets/images/sign.png");
    final signImage = pw.MemoryImage(signImageData.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: backgroundImage,
                fit: pw.BoxFit.fitWidth,
              ),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Image(logoImage, width: 100, height: 100),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(
                          "KUMARAKOM",
                          style: const pw.TextStyle(fontSize: 24),
                        ),
                        pw.Text(
                          "Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromHex('#9A9A9A'),
                          ),
                        ),
                        pw.Text(
                          "kottayam, Kerala - 686563 e-mail: unknown@gmail.com",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromHex('#9A9A9A'),
                          ),
                        ),
                        pw.Text(
                          " e-mail: unknown@gmail.com",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromHex('#9A9A9A'),
                          ),
                        ),
                        pw.Text(
                          "Mob: +91 9876543210 | +91 9786543210",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromHex('#9A9A9A'),
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Text(
                          "GST No: 32AABCU9603R1ZW",
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Divider(),
                pw.Text(
                  'Patient Details',
                  style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex("#00A64F"),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Name: ${patientData['name']}'),
                        pw.Text('Address: ${patientData['address']}'),
                        pw.Text('Phone: ${patientData['phone']}'),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Executive: ${patientData['excecutive']}'),
                        pw.Text('Branch: ${patientData['branch']}'),
                        pw.Text(
                            'Date and Time: ${patientData['date_nd_time']}'),
                        pw.Text('Payment: ${patientData['payment']}'),
                      ],
                    ),
                  ],
                ),
                pw.Divider(borderStyle: pw.BorderStyle.dashed),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Total Amount: ${patientData['total_amount']}'),
                        pw.Text(
                            'Discount Amount: ${patientData['discount_amount']}'),
                        pw.Text(
                            'Advance Amount: ${patientData['advance_amount']}'),
                        pw.Text(
                            'Balance Amount: ${patientData['balance_amount']}'),
                        pw.Text('Treatments: ${patientData['treatments']}'),
                        pw.SizedBox(
                          height: 40,
                        ),
                        pw.Text(
                          "Thank you for choosing us",
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromHex('#00A64F'),
                          ),
                        ),
                        pw.Text(
                          "Your well-being is our commitment, and we're honored ",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromHex('#c9c9c9'),
                          ),
                        ),
                        pw.Text(
                          "you've entrusted us with your health journey",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColor.fromHex('#c9c9c9'),
                          ),
                        ),
                        pw.Image(signImage, width: 107, height: 41.28),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
