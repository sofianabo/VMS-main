import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/AddFullEmployeeAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';

Add_Full_Employee(BuildContext context) {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController phoneNumper = TextEditingController();
  TextEditingController emergencyNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController Salary = TextEditingController();
  TextEditingController facebookUrl = TextEditingController();
  TextEditingController xPlatformUrl = TextEditingController();
  TextEditingController linkedinUrl = TextEditingController();
  TextEditingController instagramUrl = TextEditingController();
  TextEditingController bankAccountTitle = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankBranchName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController Experience = TextEditingController();
  TextEditingController Note = TextEditingController();

  Get.dialog(GetBuilder<Allempolyeecontroller>(builder: (controller) {
    return VMSAlertDialog(
        action: [
          ButtonDialog(
              text: "Add Employee",
              onPressed: () async {
                await AddFullEmployee.addFullEmployees(
                  First_Name: firstName.text,
                  Last_Name: lastName.text,
                  Father_Name: fatherName.text,
                  Mother_Name: motherName.text,
                  Phone_Numper: phoneNumper.text,
                  Emergency_Number: emergencyNumber.text,
                  Address: Address.text,
                  Current_Address: currentAddress.text,
                  Birth_Date: controller.Birthdate.value.toString(),
                  Join_Date: controller.Joindate.value.toString(),
                  Jop_Title: controller.dialogjobTitleIndex,
                  Gender: controller.GenderListIndex,
                  Family_State: controller.Family_StatusIndex,
                  Salary: Salary.text,
                  selectedImage:
                      Get.find<AddFullEmployeeController>().selectedImage.value,
                  Facebook_URL: facebookUrl.text,
                  X_Platform_URL: xPlatformUrl.text,
                  Linkedin_URL: linkedinUrl.text,
                  Instagram_URL: instagramUrl.text,
                  Bank_Account_Title: bankAccountTitle.text,
                  Bank_Name: bankName.text,
                  Bank_Branch_Name: bankBranchName.text,
                  Bank_Account_Number: bankAccountNumber.text,
                  IFSC_Code: ifscCode.text,
                  Career_History: careerHistory.text,
                  Qualification: Qualification.text,
                  Experience: Experience.text,
                  Note: Note.text,
                );
                Get.back();
              },
              color: Get.theme.primaryColor,
              width: 140)
        ],
        contents: GetBuilder<AddFullEmployeeController>(builder: (controller) {
          return SizedBox(
            width: 520,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () async {
                                await controller.pickImage(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: const Color(0xffC4C4C4),
                                maxRadius: 100,
                                backgroundImage:
                                    controller.selectedImage.value != null
                                        ? MemoryImage(
                                            controller.selectedImage.value!)
                                        : null,
                                child: controller.selectedImage.value == null
                                    ? const Icon(
                                        Icons.image_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      )
                                    : null, // عرض الأيقونة إذا لم تكن هناك صورة
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 250,
                              controller: firstName,
                              Uptext: "First Name",
                              hinttext: "First Name"),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 250,
                                controller: lastName,
                                Uptext: "Last Name",
                                hinttext: "Last Name"),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            isRequired: true,
                            width: 250,
                            controller: fatherName,
                            Uptext: "Father Name",
                            hinttext: "Father Name"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Textfildwithupper(
                              isRequired: true,
                              width: 250,
                              controller: motherName,
                              Uptext: "Mother Name",
                              hinttext: "Mother Name"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            isRequired: true,
                            width: 250,
                            controller: phoneNumper,
                            Uptext: "Phone Numper",
                            hinttext: "Phone Numper"),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: BirthDate(
                              isRequired: true,
                              Uptext: "Birthdate",
                              width: 250,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            isRequired: true,
                            width: 250,
                            controller: emergencyNumber,
                            Uptext: "Emergency Number",
                            hinttext: "Emergency Number"),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: JoinDate(
                              isRequired: true,
                              Uptext: "Join Date",
                              width: 250,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            isRequired: true,
                            width: 250,
                            controller: Address,
                            Uptext: "Address",
                            hinttext: "Address"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Textfildwithupper(
                              isRequired: true,
                              width: 250,
                              controller: currentAddress,
                              Uptext: "Current Address",
                              hinttext: "Current Address"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: Salary,
                            Uptext: "Salary",
                            hinttext: "Salary"),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Dropdownallemployee(
                              title: "Job Title",
                              width: 250,
                              type: "dialogjobTitle"),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Dropdownallemployee(
                            title: "Gender", width: 250, type: "Gender"),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Dropdownallemployee(
                              title: "Family Status",
                              width: 250,
                              type: "Family_Status"),
                        )

                        // Gender
                        // Family_Status
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Social Media Info :",
                          style: Get.theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: facebookUrl,
                            Uptext: "Facebook URL",
                            hinttext: "Facebook URL"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: xPlatformUrl,
                              Uptext: "X Platform URL",
                              hinttext: "X Platform URL"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: linkedinUrl,
                            Uptext: "Linkedin URL",
                            hinttext: "Linkedin URL"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: instagramUrl,
                              Uptext: "Instagram URL",
                              hinttext: "Instagram URL"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Teacher Bank Info :",
                          style: Get.theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: bankAccountTitle,
                            Uptext: "Bank Account Title",
                            hinttext: "Bank Account Title"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: bankName,
                              Uptext: "Bank Name",
                              hinttext: "Bank Name"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: bankBranchName,
                            Uptext: "Bank Branch Name",
                            hinttext: "Bank Branch Name"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: bankAccountNumber,
                              Uptext: "Bank Account Number",
                              hinttext: "Bank Account Number"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: ifscCode,
                            Uptext: "IFSC Code",
                            hinttext: "IFSC Code"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Divider(
                      color: Get.theme.primaryColor,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            controller: careerHistory,
                            hinttext: "Career History"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            isRequired: true,
                            controller: Qualification,
                            hinttext: "Qualification"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            isRequired: true,
                            controller: Experience,
                            hinttext: "Experience"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(controller: Note, hinttext: "Note"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        apptitle: "Add Employee",
        subtitle: "none");
  }));
}
