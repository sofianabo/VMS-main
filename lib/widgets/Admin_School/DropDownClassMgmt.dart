import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';

class DropDownClassMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? read;
  final bool? isLoading;

  const DropDownClassMgmt({
    super.key,
    required this.title,
    this.color,
    this.read,
    required this.isLoading,
    required this.width,
    required this.type,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (cont) {
      String currentValue = selectedValue ?? title;
      switch (type) {
        case 'grade':
          currentValue = cont.selectedgradeIndex.isNotEmpty
              ? cont.selectedgradeIndex
              : title;
          break;
        case 'session':
          currentValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
              : title;
          break;
        case 'gradediag':
          currentValue = cont.selectedgradeDiagIndex.isNotEmpty
              ? cont.selectedgradeDiagIndex
              : title;
          break;
        case 'sessiondag':
          currentValue = cont.selectedsessionDiagIndex.isNotEmpty
              ? cont.selectedsessionDiagIndex
              : title;
          break;
        case 'admin':
          currentValue = cont.selectedAdminDiagIndex.isNotEmpty
              ? cont.selectedAdminDiagIndex
              : title;
          break;
        case 'editeGrade':
          currentValue =
          cont.editeGradeIndexs.isNotEmpty ? cont.editeGradeIndexs : title;
          break;
        case 'editeSession':
          currentValue = cont.editeSessionIndexs.isNotEmpty
              ? cont.editeSessionIndexs
              : title;
          break;
        case 'editeAdmin':
          currentValue =
          cont.editeAdminIndexs.isNotEmpty ? cont.editeAdminIndexs : title;
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

                    switch (type) {
                      case 'gradediag':
                        cont.setGeidx(Get.find<Dropdowngradecontroller>().gradess!.grades!.firstWhere((grad) => grad.enName  == newValue || grad.name  == newValue).id);
                        print(cont.grades);
                        break;
                      case 'admin':
                        Get.find<Virtual_Employee_Controller>().setVECUserID(Get.find<Virtual_Employee_Controller>().viraulClasses!.firstWhere((admin) => admin.userName  == newValue).id);
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
                    cont.selectIndex(type, "");
                    cont.update();
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

  List<DropdownMenuItem<String>> _getDropdownItems(ClassMgmtController cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'grade':
        items.addAll(cont.listgradeNormal.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'session':
        items.addAll(cont.listsessionNormal.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'gradediag':
        items.addAll(cont.listgradeDiag.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'sessiondag':
        items.addAll(cont.listsessionDiag.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'admin':
        items.addAll(cont.listAdminDiag.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'editeGrade':
        items.addAll(cont.editeGrade.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'editeSession':
        items.addAll(cont.editeSession.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'editeAdmin':
        items.addAll(cont.editeAdmin.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
              Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
