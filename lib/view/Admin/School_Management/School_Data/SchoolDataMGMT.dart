import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Info_Export.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/School_Data_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Update_School_Data.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class SchoolDataMgmt extends StatefulWidget {
  const SchoolDataMgmt({super.key});

  @override
  State<SchoolDataMgmt> createState() => _SchoolDataMgmtState();
}

class _SchoolDataMgmtState extends State<SchoolDataMgmt> {
  @override
  void initState() {
    School_Data_API(context).School_Data();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<SchoolInfoController>(builder: (controller) {
      return controller.isLoading == true ?
          const Center()
          :Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      style: const ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                      onPressed: () {
                        Update_School_Data_API(context).Update_School_Data();
                      },
                      icon: Icon(Icons.save,
                          size: 18, color: Theme.of(context).highlightColor)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                    child: IconButton(
                        style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () async {
                          await exportToPdf(controller.SchoolInfo);
                        },
                        icon: Icon(VMS_Icons.pdf,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
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
                        style: const ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          exportToExcel(controller.SchoolInfo, [
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                          ]);
                        },
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<SchoolInfoController>(builder: (controller) {
                      return Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffB3B3B3)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 30.0),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Textfildwithupper(
                                    isRequired: true,
                                      width: Get.width / 2.5,
                                      controller: controller.School_Name,
                                      Uptext: "School Name",
                                      hinttext: "School Name"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.License_Number,
                                        Uptext: "License Number",
                                        hinttext: "License Number"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Textfildwithupper(
                                      isRequired: true,
                                      width: Get.width / 2.5,
                                      controller: controller.Address,
                                      Uptext: "Address",
                                      hinttext: "Address"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Village,
                                        Uptext: "Village",
                                        hinttext: "Village"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Textfildwithupper(
                                      isRequired: true,
                                      width: Get.width / 2.5,
                                      controller: controller.Region,
                                      Uptext: "Region",
                                      hinttext: "Region"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Phone,
                                        Uptext: "Phone",
                                        hinttext: "Phone"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Textfildwithupper(
                                      isRequired: true,
                                      width: Get.width / 2.5,
                                      controller: controller.Work_Begin_Year,
                                      Uptext: "Work Begin Year",
                                      hinttext: "Work Begin Year"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Creation_Year,
                                        Uptext: "Creation Year",
                                        hinttext: "Creation Year"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Textfildwithupper(
                                      isRequired: true,
                                      width: Get.width / 2.5,
                                      controller: controller.Email,
                                      Uptext: "Email",
                                      hinttext: "Email"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller: controller.Fax,
                                        Uptext: "Fax",
                                        hinttext: "Fax"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: controller.Clinic_Name,
                                      Uptext: "Clinic Name",
                                      hinttext: "Clinic Name"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller:
                                            controller.Congregation_number,
                                        Uptext: "Congregation number",
                                        hinttext: "Congregation number"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: controller.Previous_name,
                                      Uptext: "Previous name",
                                      hinttext: "Previous name"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Town_Chip,
                                        Uptext: "Town Chip",
                                        hinttext: "Town Chip"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      children: [
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  value: controller
                                                      .Outstanding_School.value,
                                                  onChanged: (value) {
                                                    controller
                                                        .Outstanding_School
                                                        .value = value!;
                                                  },
                                                ),
                                                const Text("Outstanding School"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  value: controller
                                                      .Taken_OverSchool.value,
                                                  onChanged: (value) {
                                                    controller.Taken_OverSchool
                                                        .value = value!;
                                                  },
                                                ),
                                                const Text("Taken Over School"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  value: controller
                                                      .Reassignment_Teachers
                                                      .value,
                                                  onChanged: (value) {
                                                    controller
                                                        .Reassignment_Teachers
                                                        .value = value!;
                                                  },
                                                ),
                                                const Text("Reassignment Teachers"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  value: controller
                                                      .Martyrs_Sons.value,
                                                  onChanged: (value) {
                                                    controller.Martyrs_Sons
                                                        .value = value!;
                                                  },
                                                ),
                                                const Text("Martyrs Sons"),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: SizedBox(
                                      width: Get.width / 2.5,
                                      child: Column(
                                        children: [
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Internet_Connection
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .Internet_Connection
                                                          .value = value!;
                                                    },
                                                  ),
                                                  const Text("Internet Connection"),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Government_Connection
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .Government_Connection
                                                          .value = value!;
                                                    },
                                                  ),
                                                  const Text("Government Connection"),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Joint_Building.value,
                                                    onChanged: (value) {
                                                      controller.Joint_Building
                                                          .value = value!;
                                                    },
                                                  ),
                                                  const Text("Joint Building"),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Industrial_Section
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .Industrial_Section
                                                          .value = value!;
                                                    },
                                                  ),
                                                  const Text("Industrial Section"),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
