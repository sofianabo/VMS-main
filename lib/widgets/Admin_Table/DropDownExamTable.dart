import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamCuriculmAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamTypeAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTypeModel.dart';
import 'package:vms_school/Theme/themeController.dart';

class DropDownexamTable extends StatelessWidget {
  final double width;
  final String title;
  final String type; // تحديد نوع الـ DropDown
  final Color? color;
  bool isDisabled;
  bool isLoading;
  DropDownexamTable({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamTableController>(builder: (cont) {
      // القيمة الافتراضية تكون العنوان، وبالاعتماد على النوع نقوم بالتغيير عند الاختيار
      String selectedValue = "";

      // تحديد القيمة المختارة بناءً على النوع
      switch (type) {
        case 'type':
          selectedValue =
              cont.selectedExamType.isNotEmpty ? cont.selectedExamType : title;
          break;
        case 'class':
          selectedValue = cont.selectedExamClass.isNotEmpty
              ? cont.selectedExamClass
              : title;
          break;

        case 'season':
          selectedValue = cont.selectedExamSeason.isNotEmpty
              ? cont.selectedExamSeason
              : title;
          break;
        case 'typeDialog':
          selectedValue = cont.selectedTypeDialog.isNotEmpty
              ? cont.selectedTypeDialog
              : title;
          break;
        case 'classDialog':
          selectedValue = cont.selectedClassDailog.isNotEmpty
              ? cont.selectedClassDailog
              : title;
          break;
        case 'curiculmDialog':
          selectedValue = cont.selectedCuriculmDialog.isNotEmpty
              ? cont.selectedCuriculmDialog
              : title;
          break;
        case 'semesterDialog':
          selectedValue = cont.selectedSemesterDialog.isNotEmpty
              ? cont.selectedSemesterDialog
              : title;
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
        child: isDisabled == true
            ? Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            : isLoading == true
                ? const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                  )
                : DropdownButton<String>( 
                    dropdownColor: Theme.of(context).cardColor,
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Theme.of(context).cardColor,
                    value: selectedValue,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_drop_down,
                            color: Theme.of(context).secondaryHeaderColor),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!,
                    onChanged: (newValue) {
                      if (newValue != null) {
                        cont.selectIndex(type, newValue);
                      }
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: title,
                        enabled: false,
                        child: Text(title,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      ..._getDropdownItems(cont, context),
                    ],
                    borderRadius: BorderRadius.circular(3),
                  ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      ExamTableController cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    String seasonindex;
    String classindex;

    switch (type) {
      case 'type':
        items.addAll(cont.examType.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () {},
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.examClass.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {},
          );
        }).toList());
        break;

      case 'season':
        items.addAll(cont.examSeason.map((String value) {
          return DropdownMenuItem<String>(
            value: value.tr,
            child: Text(value.tr, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {
              seasonindex = value.tr;
              AllExamTypeModel types = await Dropdownexamtypeapi(context)
                  .Dropdownexamtype(cont.examSeason.indexOf(seasonindex));
              cont.setAllTypes(types);
            },
          );
        }).toList());
        break;
      case 'semesterDialog':
        items.addAll(cont.semesterDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.tr, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {
              seasonindex = value.tr;
              AllExamTypeModel types = await Dropdownexamtypeapi(context)
                  .Dropdownexamtype(cont.examSeason.indexOf(seasonindex));
              cont.setAllTypesDialog(types);
            },
          );
        }).toList());
        break;
      case 'classDialog':
        items.addAll(cont.classDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {
              classindex = value;
              DropDowmCuriculmModel curi =
                  await Dropdownexamcuriculmapi(context).Dropdownexamcuriculm(
                      cont.classDialogList.indexOf(classindex));
              cont.setAllCuriculm(curi);
            },
          );
        }).toList());
        break;
      case 'curiculmDialog':
        items.addAll(cont.curiculmDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          );
        }).toList());
        break;
      case 'typeDialog':
        items.addAll(cont.typeDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
          );
        }).toList());
        break;
    }

    return items;
  }
}
