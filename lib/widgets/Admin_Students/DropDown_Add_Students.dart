import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';

class DropdownAddStudents extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool? isDisabled;

  const DropdownAddStudents({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    required this.isLoading,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Add_Students_Controller>(builder: (cont) {
      String selectedValue = title;

      switch (type) {
        case 'Gender':
          selectedValue = cont.selectedGenderIndex.isNotEmpty
              ? cont.selectedGenderIndex
              : title;
          break;
        case 'Realagon':
          selectedValue = cont.selectedRealagonIndex.isNotEmpty
              ? cont.selectedRealagonIndex
              : title;
          break;
        case 'BloodType':
          selectedValue = cont.selectedBloodTypeIndex.isNotEmpty
              ? cont.selectedBloodTypeIndex
              : title;
          break;
        case 'Location':
          selectedValue = cont.selectedLocationIndex.isNotEmpty
              ? cont.selectedLocationIndex
              : title;
          break;
        case 'FamilyState':
          selectedValue = cont.selectedFamilyStateIndex.isNotEmpty
              ? cont.selectedFamilyStateIndex
              : title;
          break;
        case 'Class':
          selectedValue = cont.selectedClassIndex.isNotEmpty
              ? cont.selectedClassIndex
              : title;
          break;
        case 'Division':
          selectedValue = cont.selectedDivisionIndex.isNotEmpty
              ? cont.selectedDivisionIndex
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
            ? const Row(
                children: [
                  Text(
                    "Division",
                    style: TextStyle(color: Colors.grey),
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
                : Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          onChanged: (newValue) {
                            if (newValue != null && newValue != title) {
                              cont.selectIndex(type, newValue);
                              if (type == 'Class') {
                                if (newValue != title) {
                                  Dropdowndivisionapi(context).Dropdowndivision(
                                      cont.Classlist.indexOf(newValue), 0);
                                }
                              }
                              if (type == 'Location') {
                                if (newValue != title) {
                                  Get.find<Location_controller>()
                                      .setLocationsid(
                                          cont.Locationlist.indexOf(newValue));
                                }
                              }
                            }
                          },
                          dropdownColor: Get.theme.cardColor,
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Get.theme.cardColor,
                          value: selectedValue,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Get.theme.secondaryHeaderColor,
                          ),
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 14),
                          items: [
                            DropdownMenuItem<String>(
                              value: title,
                              child: Text(
                                title,
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            ..._getDropdownItems(cont, context),
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
      Add_Students_Controller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'Gender':
        items.addAll(cont.Genderlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
      case 'Realagon':
        items.addAll(cont.Realagonlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
      case 'BloodType':
        items.addAll(cont.BloodTypelist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {},
          );
        }).toList());
        break;
      case 'Location':
        items.addAll(cont.Locationlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
      case 'FamilyState':
        items.addAll(cont.FamilyStatelist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
      case 'Class':
        items.addAll(cont.Classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {},
          );
        }).toList());
        break;
      case 'Division':
        items.addAll(cont.Divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {},
          );
        }).toList());
        break;
    }

    return items;
  }
}
