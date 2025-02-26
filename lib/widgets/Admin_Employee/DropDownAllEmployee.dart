import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';

class Dropdownallemployee extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;

  const Dropdownallemployee({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allempolyeecontroller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'jobTitle':
          selectedValue = cont.selectejobTitleIndex.isNotEmpty
              ? cont.selectejobTitleIndex
              : title;
          break;
        case 'roll':
          selectedValue =
              cont.selecterollIndex.isNotEmpty ? cont.selecterollIndex : title;
          break;
        case 'feroll':
          selectedValue = cont.selecteferollIndex.isNotEmpty
              ? cont.selecteferollIndex
              : title;
          break;
        case 'fejop':
          selectedValue = cont.selectefejopIndex.isNotEmpty
              ? cont.selectefejopIndex
              : title;
          break;
        case 'rolldialog':
          selectedValue = cont.selectedrolldialogIndex.isNotEmpty
              ? cont.selectedrolldialogIndex
              : title;
          break;
        case 'dialogjobTitle':
          selectedValue = cont.selecteddialogjobTitleIndex.isNotEmpty
              ? cont.selecteddialogjobTitleIndex
              : title;
          break;
        case 'Gender':
          selectedValue = cont.selecteGenderIndex.isNotEmpty
              ? cont.selecteGenderIndex
              : title;
          break;
        case 'Family_Status':
          selectedValue = cont.selecteFamily_StatusIndex.isNotEmpty
              ? cont.selecteFamily_StatusIndex
              : title;
          break;
        case 'Contract':
          selectedValue = cont.selecteContractTypeIndex.isNotEmpty
              ? cont.selecteContractTypeIndex
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
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                icon: selectedValue != title
                    ? GestureDetector(
                        onTap: () {
                          cont.selectIndex(type, "");
                        },
                        child: Icon(
                          Icons.close,
                          color: Get.theme.secondaryHeaderColor,
                        ),
                      )
                    : Icon(Icons.arrow_drop_down_outlined,
                        color: Get.theme.secondaryHeaderColor),
                dropdownColor: Get.theme.cardColor,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Get.theme.cardColor,
                value: selectedValue,
                isExpanded: true,
                underline: const SizedBox(),
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                onChanged: (newValue) {
                  if (newValue != null) {
                    cont.selectIndex(type, newValue);
                  }
                },
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

  List<DropdownMenuItem<String>> _getDropdownItems(Allempolyeecontroller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'jobTitle':
        items.addAll(cont.JobTitleList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
      case 'feroll':
        items.addAll(cont.feRoll.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'fejop':
        items.addAll(cont.feJoptitle.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'roll':
        items.addAll(cont.rolllist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'dialogjobTitle':
        items.addAll(cont.dialogjobTitleList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Gender':
        items.addAll(cont.GenderList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Family_Status':
        items.addAll(cont.Family_StatusList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'rolldialog':
        items.addAll(cont.rolldialoglist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Contract':
        items.addAll(cont.contractList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
