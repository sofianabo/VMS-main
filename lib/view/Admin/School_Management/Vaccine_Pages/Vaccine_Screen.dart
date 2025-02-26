import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Location_API/Locations_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Add_Vaccines_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Get_All_Vaccines_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/view/Admin/School_Management/Vaccine_Pages/Vaccine_Grid.dart';
import 'package:vms_school/widgets/Admin_Students/DropDown_Add_Students.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Vaccine_Screen extends StatefulWidget {
  Vaccine_Screen({super.key});

  @override
  State<Vaccine_Screen> createState() => _Vaccine_ScreenState();
}

class _Vaccine_ScreenState extends State<Vaccine_Screen> {
  TextEditingController search = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  @override
  void initState() {
    Get_Vaccines_API(context).Get_Vaccines();
    Get_Location_API.Get_Locations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      GetBuilder<Vaccines_Controller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(value);
                            },
                            width: w * 0.7,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        );
                      }),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(GetBuilder<Vaccines_Controller>(
                                  builder: (controller) {
                                return VMSAlertDialog(
                                    contents: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 400,
                                        ),
                                        Textfildwithupper(
                                            width: 350,
                                            controller: name,
                                            Uptext: "Name",
                                            hinttext: "Name"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Textfildwithupper(
                                              width: 350,
                                              controller: enName,
                                              Uptext: "English Name",
                                              hinttext: "English Name"),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: DropdownAddStudents(
                                              isLoading:
                                                  controller.isLoadingLocation,
                                              title: "Location",
                                              width: 350,
                                              type: "Location"),
                                        ),
                                      ],
                                    ),
                                    action: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ButtonDialog(
                                              width: 150,
                                              text: "Add Vaccine",
                                              onPressed: () async {
                                                await Add_Vaccines_API(context)
                                                    .Add_Vaccines(
                                                  name: name.text,
                                                  enName: enName.text,
                                                  locationId: Get.find<
                                                          Location_controller>()
                                                      .Locationsid,
                                                );
                                              },
                                              color:
                                                  Theme.of(context).canvasColor)
                                        ],
                                      )
                                    ],
                                    apptitle: "Add Vaccine",
                                    subtitle: "none");
                              }));
                            },
                            icon: Icon(Icons.add,
                                size: 18,
                                color: Theme.of(context).primaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Vaccine_Grid(),
        )),
      ],
    ));
  }
}
