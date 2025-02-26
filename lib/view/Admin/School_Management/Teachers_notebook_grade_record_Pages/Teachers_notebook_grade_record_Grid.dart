import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Functions/Add_Teacher_Functions.dart';

class GradesTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TeachernoteAndGradeReco controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("درجات الطلاب")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Get.dialog(Rerange_Group());
                },
                child: Obx(() {
                  return Table(
                    border: TableBorder.all(color: Colors.black, width: 1),
                    columnWidths: {
                      for (int i = 0; i < controller.columnWidths.length; i++)
                        i: FixedColumnWidth(controller.columnWidths[i]),
                    },
                    children: _buildTableRows(controller),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TableRow> _buildTableRows(TeachernoteAndGradeReco controller) {
    List<TableRow> rows = [];

    // صف لعرض أسماء المجموعات (header)
    rows.add(TableRow(
      children: List.generate(
        controller.groups.length,
        (index) {
          // تحويل القيمة إلى String
          String name = controller.groups[index]['name'] as String;
          return tableCell(name, index, isHeader: true);
        },
      ),
    ));

    // صف لعرض العناصر (items) فقط
    rows.add(TableRow(
      children: List.generate(controller.groups.length, (index) {
        // تحويل items إلى List<dynamic>
        List<dynamic> items =
            controller.groups[index]['items'] as List<dynamic>;
        if (items.isEmpty) {
          return tableCell(" ", index);
        }
        return tableCellWithItems(items, index, isHeader: true);
      }),
    ));

    // صف لعرض نسبة كل مجموعة
    rows.add(TableRow(
      children: List.generate(controller.groups.length, (index) {
        // تحويل items إلى List<dynamic>
        List<dynamic> items =
            controller.groups[index]['items'] as List<dynamic>;
        if (controller.groups[index]['ratio'] == 0) {
          return tableCell(" ", index);
        }
        return tableCellWithItems(items, index, showRatio: true);
      }),
    ));

    return rows;
  }

  Widget tableCellWithItems(List items, int index,
      {bool showRatio = false, bool isHeader = false}) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        double newWidth =
            Get.find<TeachernoteAndGradeReco>().columnWidths[index] +
                details.primaryDelta!;
        if (newWidth >= 80.0 && newWidth <= 800.0) {
          Get.find<TeachernoteAndGradeReco>().resizeColumn(index,
              details.primaryDelta!); // استدعاء تغيير الحجم من الـ controller
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeLeftRight,
        child: SizedBox(
          width: Get.find<TeachernoteAndGradeReco>().columnWidths[index],
          child: items.isEmpty
              ? Center(
                  child: Text(
                    showRatio
                        ? Get.find<TeachernoteAndGradeReco>()
                            .groups[index]['ratio']
                            .toString()
                        : '',
                    textAlign: TextAlign.center,
                  ),
                )
              : Row(
                  children: List.generate(items.length, (itemIndex) {
                    return Expanded(
                      child: Container(
                        height: 45,
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        alignment: Alignment.center,
                        child: Text(
                          showRatio
                              ? items[itemIndex]['ratio'].toString()
                              : items[itemIndex]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: isHeader
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }

  Widget tableCell(String text, int index, {bool isHeader = false}) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        double newWidth =
            Get.find<TeachernoteAndGradeReco>().columnWidths[index] +
                details.primaryDelta!;
        if (newWidth >= 80.0 && newWidth <= 800.0) {
          Get.find<TeachernoteAndGradeReco>().resizeColumn(index,
              details.primaryDelta!); // استدعاء تغيير الحجم من الـ controller
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeLeftRight,
        child: Container(
          width: Get.find<TeachernoteAndGradeReco>().columnWidths[index],
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
