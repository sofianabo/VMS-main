import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';

class DropDownDivisionMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue; // إضافة هذه القيمة
  final Color? color;
  final bool? isLoading;

  const DropDownDivisionMgmt({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.selectedValue,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Divisions_Controller>(builder: (cont) {
      String currentValue = selectedValue ?? title;

      switch (type) {
        case 'class':
          currentValue =
              cont.selectClassIndex.isNotEmpty ? cont.selectClassIndex : title;
          break;

        case 'classDiag':
          currentValue = cont.selectClassDiagIndex.isNotEmpty
              ? cont.selectClassDiagIndex
              : title;
          break;

        default:
          break;
      }

      return Container(
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? const Color(0xffD9D9D9)),
        ),
        child: isLoading == true
            ? const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        )
            : Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                onChanged: (newValue) {
                  if (newValue != null && newValue != title) {
                    cont.selectIndex(type, newValue);
                    cont.selectIndex(type, newValue);
                    switch (type) {
                      case 'class':
                        cont.SetClassIdx(cont.Classmodel!.classes!.firstWhere((clas) => clas.enName  == newValue || clas.name  == newValue).id);
                        print(cont.dropclasses);

                        break;
                      case 'classDiag':
                        cont.SetClassDiagIdx(cont.Classmodel!.classes!.firstWhere((clas) => clas.enName  == newValue || clas.name  == newValue).id);
                        print(cont.dropDiagClasses);
                        break;
                    }
                  }
                },
                dropdownColor: Get.theme.cardColor,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Get.theme.cardColor,
                value: currentValue,
                isExpanded: true,
                underline: const SizedBox(),
                icon: currentValue != title
                    ? GestureDetector(
                  onTap: () {
                    // إعادة تعيين القيمة إلى الافتراضية
                    cont.selectIndex(type, "");
                    cont.update(); // تحديث واجهة المستخدم
                  },
                  child: Icon(
                    Icons.close,
                    color: Get.theme.secondaryHeaderColor,
                  ),
                )
                    : Icon(
                  Icons.arrow_drop_down,
                  color: Get.theme.secondaryHeaderColor,
                ),
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                items: [
                  DropdownMenuItem<String>(
                    value: title,
                    enabled: false,
                    child: Text(
                      title,
                      style: Get.theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ..._getDropdownItems(cont),
                ],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Divisions_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'class':
        items.addAll(cont.listClass.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'classDiag':
        items.addAll(cont.listClassDiag.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
