import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';
import 'dart:typed_data';
import 'dart:ui' as ui; // للتعامل مع الصور في Flutter
import 'dart:html' as html; // لإنشاء رابط تحميل الملف في Flutter Web
import 'package:pdf/pdf.dart'; // مكتبة PDF
import 'package:pdf/widgets.dart' as pw; // مكتبة لإنشاء محتوى PDF

class Rewards_Screen extends StatelessWidget {
  Rewards_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: Get.find<RewardsController>().addTextOverlay,
                  child: Text("إضافة نص"),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveRewardsAsPdf();
                  },
                  child: Text("حفظ PDF"),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: RewardsGrid(),
          )),
        ],
      )),
    );
  }

  Future<void> saveRewardsAsPdf() async {
    final controller = Get.find<RewardsController>();

    // إظهار الـ Dialog أولاً
    Get.defaultDialog(
      barrierDismissible: false,
      title: "جاري التحميل...",
      content: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(value: controller.progress.value),
            SizedBox(height: 20),
            Text("${(controller.progress.value * 100).toStringAsFixed(0)}%")
          ],
        );
      }),
    );

    // إضافة تأخير صغير ليتمكن المستخدم من رؤية الـ Dialog
    await Future.delayed(Duration(milliseconds: 500)); // تأخير نصف ثانية

    try {
      print("بدء عملية تحميل الصورة...");

      RenderRepaintBoundary boundary = RewardsGloballKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      controller.progress.value = 0.35;
      print("تم تحميل الصورة بنجاح.");

      await processPdfInChunks(pngBytes, controller);

      controller.progress.value = 1.0;
      Get.back();

      print("تم تحميل PDF بنجاح 🎉");
    } catch (e) {
      print("حدث خطأ أثناء إنشاء PDF: $e");
      Get.back(); // إغلاق الـ Dialog في حالة حدوث خطأ
    }
  }

// معالجة الـ PDF خطوة بخطوة
  Future<void> processPdfInChunks(
      Uint8List pngBytes, RewardsController controller) async {
    final pdf = pw.Document();
    final imageProvider = pw.MemoryImage(pngBytes);
    final pdfWidth = (PdfPageFormat.a4.landscape.width);
    final pdfHeight = (PdfPageFormat.a4.landscape.height);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(
          PdfPageFormat.a4.landscape.width,
          PdfPageFormat.a4.landscape.height,
        ),
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(
              imageProvider,
              width: pdfWidth,
              height: pdfHeight,
            ),
          );
        },
      ),
    );

    // تحديث التقدم إلى 75% قبل الحفظ مباشرة
    controller.progress.value = 0.75;
    await Future.delayed(Duration(milliseconds: 100));

    final stopwatch = Stopwatch()..start(); // بدء التوقيت
    final pdfBytes = await savePdf(pdf); // حفظ الـ PDF
    stopwatch.stop();

    print("تم حفظ الـ PDF. استغرق الحفظ: ${stopwatch.elapsedMilliseconds}ms");

    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "certificate.pdf")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  Future<Uint8List> savePdf(pw.Document pdf) async {
    return await pdf.save();
  }
}
