import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Theme/themeController.dart';

class Dropdownrequestenroll extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool? isDisabled;

  const Dropdownrequestenroll({
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
    return GetBuilder<Requestscontroller>(builder: (cont) {
      String selectedValue = title;

      switch (type) {
        case 'status':
          if (cont.statusList.contains(cont.selectedStatusIndex)) {
            selectedValue = cont.selectedStatusIndex;
          }
          break;
        case 'class':
          if (cont.classlist.contains(cont.selectedClassIndex)) {
            selectedValue = cont.selectedClassIndex;
          }
          break;
        case 'division':
          if (cont.divisionlist.contains(cont.selectedDivisionIndex)) {
            selectedValue = cont.selectedDivisionIndex;
          }
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
                              cont.selectIndex(type, newValue);
                            }
                          },
                          dropdownColor: Theme.of(context).cardColor,
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Theme.of(context).cardColor,
                          value: selectedValue,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: selectedValue.isNotEmpty &&
                                  selectedValue != title
                              ? GestureDetector(
                                  onTap: () {
                                    cont.selectIndex(type, "");
                                    cont.update();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          style: Theme.of(context).textTheme.bodyMedium!,
                          items: [
                            DropdownMenuItem<String>(
                              value: title,
                              child: Text(title,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
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
      Requestscontroller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'division':
        items.addAll(cont.divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {
              AllDivisionModel division = await Dropdowndivisionapi(context)
                  .Dropdowndivision(cont.classlist.indexOf(value), 0);
              print(cont.classlist.indexOf(value));
              cont.setAllDivisionDialog(division);
            },
          );
        }).toList());
        break;
      case 'status':
        items.addAll(cont.statusList.map((String value) {
          return DropdownMenuItem<String>(
            value: value.tr,
            child:
                Text(value.tr, style: Theme.of(context).textTheme.bodyMedium),
            onTap: () async {
              cont.selectIndex(type, value.tr);
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
