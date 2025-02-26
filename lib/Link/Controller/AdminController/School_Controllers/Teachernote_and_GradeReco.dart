import 'package:get/get.dart';

class TeachernoteAndGradeReco extends GetxController {
  var groups = <Map<String, dynamic>>[
    {"name": "تقديرات الفصل الأول", "ratio": 0, "size": 100.0, "items": []},
    {
      "name": "مجموع درجات الفصل الأول",
      "ratio": 100,
      "size": 100.0,
      "items": []
    },
    {
      "name": "درجة اختبار الفصل الأول",
      "ratio": 40,
      "size": 100.0,
      "items": []
    },
    {
      "name": "درجة أعمال الفصل الأول",
      "ratio": 60,
      "size": 100.0,
      "items": [
        {"name": "شفوية", "ratio": 20},
        {"name": "وظائف و أوراق عمل", "ratio": 20},
        {"name": "نشاطات و مبادرات", "ratio": 10},
        {"name": "المذاكرة", "ratio": 10},
      ]
    },
    {
      "name": "عادي",
      "ratio": 20,
      "size": 100.0,
      "items": [
        {"name": "شفوية", "ratio": 10},
        {"name": "وظائف و أوراق عمل", "ratio": 10},
      ]
    },
    {"name": "الدرجة العظمى", "ratio": 0, "size": 100.0, "items": []},
    {"name": "المواد الدراسية", "ratio": 0, "size": 100.0, "items": []}
  ].obs;
  var items = [].obs;

  void updateItemName(int idx, String newName) {
    items[idx]['name'] = newName;
    update(); // تحديث الواجهة فورًا
  }

  // تحديث نسبة العنصر
  void updateItemRatio(int idx, double newRatio) {
    items[idx]['ratio'] = newRatio;
    update(); // تحديث الواجهة فورًا
  }

  void SetItems(item) {
    items.clear();
    items.addAll(item); // أضف العناصر إلى القائمة القابلة للمراقبة
    update(); // تحديث الواجهة فورًا
  }

  void UpdateGroupItems(int idx, String groupName, double ratioValue,
      List<Map<String, dynamic>> items) {
    groups[idx] = {
      'name': groupName,
      'ratio': ratioValue,
      'items': items,
    };
    update();
  }

  Add_Items(String name, String ratio) {
    double? ratioValue = double.tryParse(ratio);
    if (ratioValue != null) {
      items.add({"name": name, "ratio": ratioValue});
      update();
    } else {
      Get.snackbar("خطأ", "قيمة النسبة غير صالحة");
    }
  }

  void updateGroups(List<Map<String, dynamic>> updatedGroups) {
    groups.assignAll(updatedGroups);
    update();
  }

  RemoveItem(int idx) {
    items.removeAt(idx);
    update();
  }

  void EditItem(int idx, String name, String ratio) {
    double? ratioValue = double.tryParse(ratio);
    if (ratioValue != null) {
      items[idx] = {"name": name, "ratio": ratioValue};
      update();
    } else {
      Get.snackbar("خطأ", "قيمة النسبة غير صالحة");
    }
  }

  RemoveGroup(int idx) {
    groups.removeAt(idx);
    update();
  }

  Add_Groub(String name, String ratio, List<Map<String, dynamic>> newItems) {
    groups.add(
      {
        "name": name,
        "ratio": double.parse(ratio),
        "size": 100.0,
        "items": List.from(newItems)
      },
    );
    columnWidths.add(100.0);
    update(); // تحديث الحالة لإعادة بناء الواجهة
  }

  var columnWidths = [100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0].obs;

  void updateGroupSizes() {
    for (int i = 0; i < groups.length; i++) {
      groups[i]["size"] = double.parse(columnWidths[i].toStringAsFixed(2));
    }
  }

  // تغيير عرض العمود عند السحب
  void resizeColumn(int index, double delta) {
    if (columnWidths[index] + delta >= 80.0 &&
        columnWidths[index] + delta <= 800.0) {
      columnWidths[index] += delta;
      updateGroupSizes(); // تحديث الحجم في groups بعد تغيير العرض
    }
  }

  pri() {
    print(groups);
  }
}
