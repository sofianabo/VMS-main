import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;

import 'package:vms_school/Link/Model/AdminModel/All_Employee_Model.dart';

void exportToExcel(List<Map<String, dynamic>> data, List<String> headers) {
  if (data.isEmpty) {
    print("لا توجد بيانات للتصدير.");
    return;
  }

  var excel = Excel.createExcel();
  Sheet sheet = excel['Sheet1'];

  // Append headers to the sheet
  sheet.appendRow(headers);

  // Iterate over the data and append each row
  for (var school in data) {
    sheet.appendRow(school.values.toList());
  }

  String fileName = 'SchoolInfo.xlsx';
  var bytes = excel.save();

  if (bytes != null) {
    // Create a Blob from the byte array
    final blob = html.Blob([bytes]);

    // Create a URL from the Blob
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create a download link and trigger the download
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = fileName
      ..click();

    // Revoke the Object URL after the download
    html.Url.revokeObjectUrl(url);
  }
}


void exportEmployeesToExcel(List<Employees> employees) async {
  List<Map<String, dynamic>> data = employees.map((emp) {
    return {
      "Username": emp.userName ?? "",
      "Full Name": emp.fullName ?? "",
      "Email": emp.email ?? "",
      "Job Title": emp.jobTitle ?? "",
      "Salary": emp.salary?.toString() ?? "",
      "Role": emp.roll ?? "",
    };
  }).toList();

  List<String> headers = [
    "Username",
    "Full Name",
    "Email",
    "Job Title",
    "Salary",
    "Role",
  ];

  exportToExcel(data, headers);
}

//
// void exportStudintToExcel(List<Students> allStudents) async {
//   List<Map<String, dynamic>> data = allStudents.map((emp) {
//     return {
//       "Username": emp. ?? "",
//       "Full Name": emp.fullName ?? "",
//       "Email": emp.email ?? "",
//       "Job Title": emp.jobTitle ?? "",
//       "Salary": emp.salary?.toString() ?? "",
//       "Role": emp.roll ?? "",
//     };
//   }).toList();
//
//   List<String> headers = [
//     "Username",
//     "Full Name",
//     "Email",
//     "Job Title",
//     "Salary",
//     "Role",
//   ];
//
//   exportToExcel(data, headers);
// }




void exportEmployeesToPDF(List<Employees> employees) async {
  // تحميل الشعار
  ByteData bytes =
  await rootBundle.load('../../images/Logo.png');
  Uint8List imageBytes = bytes.buffer.asUint8List();
  final image = pw.MemoryImage(imageBytes);

  // تحضير البيانات
  List<List<String>> data = employees.map((emp) {
    return [
       emp.userName ?? "",
       emp.fullName ?? "",
       emp.email ?? "",
       emp.jobTitle ?? "",
       emp.salary?.toString() ?? "",
       emp.roll ?? "",
    ];
  }).toList();

  List<String> headers = [
    "Username",
    "Full Name",
    "Email",
    "Job Title",
    "Salary",
    "Role",
  ];

  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4.landscape,
      header: (pw.Context context) {
        return pw.Center(
            child: pw.Column(children: [
              pw.Image(image, width: 150, height: 150),
              pw.SizedBox(height: 10)
            ]));
      },
      build: (pw.Context context) {
        return [
          pw.Table.fromTextArray(
            headers: headers,
            data: data,
            border: pw.TableBorder.all(),
            headerStyle: pw.TextStyle(
              color: PdfColors.white,
              fontWeight: pw.FontWeight.bold,
            ),
            headerDecoration: pw.BoxDecoration(
              color: PdfColor.fromHex("#134B70"),
            ),
            cellAlignment: pw.Alignment.center,
            cellHeight: 25,
          ),
        ];
      },
    ),
  );

  // حفظ PDF في ملف
  final Uint8List pdfBytes = await pdf.save();

  // إنشاء Blob وتنزيل الملف
  final blob = html.Blob([pdfBytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..target = '_blank'
    ..download = 'EmployeesExport.pdf'
    ..click();
  html.Url.revokeObjectUrl(url);
}


