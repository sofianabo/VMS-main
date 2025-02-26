import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Add_Virtual_Employee.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_Virtual_Employee.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/All_Virtual_Employee_Controller.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Virtual_User_Management_Grid.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Virtual_User_Management extends StatefulWidget {
  const Virtual_User_Management({super.key});

  @override
  State<Virtual_User_Management> createState() =>
      _Virtual_User_ManagementState();
}

class _Virtual_User_ManagementState extends State<Virtual_User_Management> {
  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  void initState() {
    Get_Virtual_Employee_API.Get_Virtual_Employee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<All_Virtual_Employee_Controller>(
          builder: (controller) {
            return Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Dropdownallemployee(
                                  title: "Job Title", width: w / 5, type: "roll")),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormSearch(
                              onchange: (value){
                                controller.searchRequestByName(value, Get.find<Allempolyeecontroller>().rollIndex);
                              },
                              click: (){
                                controller.clearFilter();
                              },
                              width: w / 2,
                              radius: 5,
                              controller: search,
                              suffixIcon: search.text.isNotEmpty ? Icons.close :  Icons.search,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
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
                                style:  ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Theme.of(context).cardColor),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {
                                  Get.dialog(VMSAlertDialog(
                                      action: [
                                        ButtonDialog(
                                            text: "Add Virtual User",
                                            onPressed: () {
                                              Add_Virtual_Employee_API.Add_Virtual_Employee(
                                                  userName: username.text,
                                                  password: password.text,
                                                  roll: Get.find<Allempolyeecontroller>().rolldialogIndex);
                                            },
                                            color: Theme.of(context).primaryColor,
                                            width: 150)
                                      ],
                                      contents: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Textfildwithupper(
                                                    Uptext: "Username",
                                                    width: 250,
                                                    controller: username,
                                                    hinttext: "Username"),
                                              ),
                                              const Dropdownallemployee(
                                                  title: "Job Title",
                                                  width: 250,
                                                  type: "rolldialog"),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Textfildwithupper(
                                                      Uptext: "Password",
                                                      width: 250,
                                                      controller: password,
                                                      hinttext: "Password"),
                                                ),
                                                Textfildwithupper(
                                                    Uptext: "Confirm Password",
                                                    width: 250,
                                                    controller: cPassword,
                                                    hinttext: "Confirm Password")
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      apptitle: "Add Virtual User",
                                      subtitle: "none"));
                                },
                                icon: Icon(Icons.add,
                                    size: 18, color: Theme.of(context).highlightColor)),
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
                                  style:  ButtonStyle(
                                      backgroundColor:
                                          WidgetStatePropertyAll(Theme.of(context).cardColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: Icon(VMS_Icons.pdf,
                                      size: 18, color: Theme.of(context).highlightColor)),
                            ),
                          ),
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
                                style:  ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Theme.of(context).cardColor),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {},
                                icon: Icon(VMS_Icons.xl,
                                    size: 18, color: Theme.of(context).highlightColor)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Virtual_User_Management_Grid(),
        )),
      ],
    ));
  }
}
