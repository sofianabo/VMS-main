import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/AddTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Add_Full_Employee.dart';
import 'package:vms_school/view/Admin/Employee_Manager/AllEmployeeGrid.dart';
import 'package:vms_school/widgets/Admin_Employee/Export_Data.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFildWithUpper.dart';
import '../../../widgets/VMSAlertDialog.dart';

class AllEmployee extends StatefulWidget {
  const AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  TextEditingController search = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController cPassword = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Employee_API.Get_All_Employee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
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
                          child: DropDownAllSessions(
                            title: "Session",
                            width: w / 6.5,
                            type: "session",
                            API: "AllEmployee",
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Dropdownallemployee(
                              title: "Job Title",
                              width: w / 6.5,
                              type: "jobTitle")),
                      GetBuilder<Allempolyeecontroller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                              print("Filter cleared");
                            },
                            width: w / 3.5,
                            radius: 5,
                            controller: search,
                            onchange: (value) {
                              controller.searchRequestByName(
                                  value, controller.jobTitleIndex);
                            },
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        );
                      }),
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
                        child: PopupMenuButton(
                          style:  ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          tooltip: "",
                          child: Icon(Icons.add,
                              size: 18, color: Theme.of(context).highlightColor),
                          onSelected: (value) {
                            if (value == "Add Employee") {
                              Get.dialog(GetBuilder<Allempolyeecontroller>(
                                  builder: (cont) {
                                return VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                          text: "Add Employee",
                                          onPressed: () async {
                                            await Addteacherapi(context)
                                                .Addteacher(
                                                    firstName.text,
                                                    lastName.text,
                                                    email.text,
                                                    username.text,
                                                    cont.Joindate.toString(),
                                                    phone.text,
                                                    cont.GenderListIndex,
                                                    cont.ContractTypeIndex
                                                        .trim(),
                                                    cont.ferollIndex == "Sub Admin" ? "subAdmin" : cont.ferollIndex,
                                                    cont.fejopIndex,
                                                    password.text);
                                          },
                                          color: Theme.of(context).primaryColor,
                                          width: 120)
                                    ],
                                    contents: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Textfildwithupper(
                                                  Uptext: "First Name",
                                                  width: 220,
                                                  controller: firstName,
                                                  hinttext: "First Name"),
                                            ),
                                            Textfildwithupper(
                                                Uptext: "Last Name",
                                                width: 220,
                                                controller: lastName,
                                                hinttext: "Last Name")
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
                                                    Uptext: "Email",
                                                    width: 220,
                                                    controller: email,
                                                    hinttext: "Email"),
                                              ),
                                              Textfildwithupper(
                                                  Uptext: "Username",
                                                  width: 220,
                                                  controller: username,
                                                  hinttext: "Username")
                                            ],
                                          ),
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
                                                    Uptext: "Phone Number",
                                                    width: 220,
                                                    controller: phone,
                                                    hinttext: "Phone Number"),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  JoinDate(
                                                    width: 220,
                                                    Uptext: "Join Date",
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.0),
                                                child: Dropdownallemployee(
                                                    title: "Job Title",
                                                    width: 220,
                                                    type: "fejop"),
                                              ),
                                              Dropdownallemployee(
                                                  title: "Roll",
                                                  width: 220,
                                                  type: "feroll"),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.0),
                                                child: Dropdownallemployee(
                                                    title: "Gender",
                                                    width: 220,
                                                    type: "Gender"),
                                              ),
                                              Dropdownallemployee(
                                                  title: "Contract Type",
                                                  width: 220,
                                                  type: "Contract"),
                                            ],
                                          ),
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
                                                    width: 220,
                                                    controller: password,
                                                    hinttext: "Password"),
                                              ),
                                              Textfildwithupper(
                                                  Uptext: "Confirm Password",
                                                  width: 220,
                                                  controller: cPassword,
                                                  hinttext: "Confirm Password")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    apptitle: "Add Employee",
                                    subtitle: "none");
                              }));
                            }
                            if (value == "Add Full Employee") {
                              Add_Full_Employee(context);
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                                value: 'Add Employee',
                                child: Text(
                                  'Add Employee',
                                )),
                            const PopupMenuItem<String>(
                                value: 'Add Full Employee',
                                child: Text('Add Full Employee')),
                          ],
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
                              style:  ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Theme.of(context).cardColor),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportEmployeesToPDF(
                                    Get.find<Allempolyeecontroller>()
                                        .filteredreemployees);
                              },
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
                            onPressed: () {
                              exportEmployeesToExcel(
                                  Get.find<Allempolyeecontroller>()
                                      .filteredreemployees);
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18, color: Theme.of(context).highlightColor)),
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
          child: AllEmployeeGrid(),
        )),
      ],
    ));
  }
}
