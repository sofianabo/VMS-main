import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/EditTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AddTeacherController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/widgets/Admin_teachers/DropDownAllTeacher.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

EditTeacherDialog(BuildContext context, int idx, String teacherId) {
  final teacherControler = Get.find<Allteachercontroller>();
  TextEditingController firstName =
      TextEditingController(text: teacherControler.oTeacher!.firstName);
  TextEditingController lastName =
      TextEditingController(text: teacherControler.oTeacher!.lastName);
  TextEditingController phoneNumber =
      TextEditingController(text: teacherControler.oTeacher!.phone);
  TextEditingController address =
      TextEditingController(text: teacherControler.oTeacher!.address);
  TextEditingController emergency =
      TextEditingController(text: teacherControler.oTeacher!.emergencyNumber);
  TextEditingController email =
      TextEditingController(text: teacherControler.oTeacher!.email);
  TextEditingController currentAddress =
      TextEditingController(text: teacherControler.oTeacher!.currentAddress);
  TextEditingController username =
      TextEditingController(text: teacherControler.oTeacher!.userName);
  TextEditingController salary =
      TextEditingController(text: teacherControler.oTeacher!.salary.toString());
  TextEditingController fatherName =
      TextEditingController(text: teacherControler.oTeacher!.fatherName);
  TextEditingController jobTitle =
      TextEditingController(text: teacherControler.oTeacher!.jobTitle);
  TextEditingController facebook =
      TextEditingController(text: teacherControler.oTeacher!.facebookUrl);
  TextEditingController motherName =
      TextEditingController(text: teacherControler.oTeacher!.motherName);
  TextEditingController x =
      TextEditingController(text: teacherControler.oTeacher!.twitterUrl);
  TextEditingController linkedin =
      TextEditingController(text: teacherControler.oTeacher!.lenkedinUrl);
  TextEditingController insta =
      TextEditingController(text: teacherControler.oTeacher!.instagramUrl);
  TextEditingController bankAccountTitle =
      TextEditingController(text: teacherControler.oTeacher!.bankAccountTitle);
  TextEditingController bankName =
      TextEditingController(text: teacherControler.oTeacher!.bankName);
  TextEditingController bankBranchName =
      TextEditingController(text: teacherControler.oTeacher!.bankBranchName);
  TextEditingController bankAccountNumber =
      TextEditingController(text: teacherControler.oTeacher!.bankAccountNumber);
  TextEditingController ifsc =
      TextEditingController(text: teacherControler.oTeacher!.iFSCCode);
  TextEditingController careerHistory =
      TextEditingController(text: teacherControler.oTeacher!.careerHistory);
  TextEditingController qualification =
      TextEditingController(text: teacherControler.oTeacher!.qualification);
  TextEditingController experience =
      TextEditingController(text: teacherControler.oTeacher!.experience);
  TextEditingController note =
      TextEditingController(text: teacherControler.oTeacher!.note);

  return Get.dialog(
    GetBuilder<Allteachercontroller>(builder: (control) {
      control.Joindate.value = DateTime.parse(
          Get.find<Allteachercontroller>().oTeacher!.joinDate.toString());
      control.Birthdate.value = DateTime.parse(
          Get.find<Allteachercontroller>().oTeacher!.birthDate.toString());

      return VMSAlertDialog(
          contents: GetBuilder<Addteachercontroller>(builder: (addcontrol) {
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
                                  await addcontrol.pickImage(context);
                                },
                                child: CircleAvatar(
                                  maxRadius: 100,
                                  backgroundColor: const Color(0xffC4C4C4),
                                  backgroundImage: addcontrol
                                              .selectedImage.value !=
                                          null
                                      ? MemoryImage(
                                          addcontrol.selectedImage.value!)
                                      : teacherControler.filteredTeacher![idx]
                                                  .imageId !=
                                              null
                                          ? NetworkImage(getimage +
                                              "${teacherControler.filteredTeacher![idx].imageId}")
                                          : null,
                                  child:
                                      addcontrol.selectedImage.value == null &&
                                              teacherControler
                                                      .filteredTeacher![idx]
                                                      .imageId ==
                                                  null
                                          ? const Icon(
                                              Icons.image_outlined,
                                              color: Colors.white,
                                              size: 40,
                                            )
                                          : null,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Textfildwithupper(
                                width: 250,
                                controller: firstName,
                                Uptext: "First Name",
                                hinttext: "First Name"),
                            Padding(
                              padding: const EdgeInsets.only(top: 22.0),
                              child: Textfildwithupper(
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
                              width: 250,
                              controller: fatherName,
                              Uptext: "Father Name",
                              hinttext: "Father Name"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
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
                              width: 250,
                              controller: phoneNumber,
                              Uptext: "Phone Number",
                              hinttext: "Phone Number"),
                          Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: EditBirthDateTeacher(
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
                              width: 250,
                              controller: emergency,
                              Uptext: "Emergency Number",
                              hinttext: "Emergency Number"),
                          Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: EditJoinDateTeacher(
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
                              width: 250,
                              controller: address,
                              Uptext: "Address",
                              hinttext: "Address"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
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
                        children: [
                          Textfildwithupper(
                              readOnly: true,
                              width: 250,
                              controller: email,
                              Uptext: "Email",
                              hinttext: "Email"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                readOnly: true,
                                width: 250,
                                controller: username,
                                Uptext: "Username",
                                hinttext: "Username"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              readOnly: true,
                              width: 250,
                              controller: salary,
                              Uptext: "Salary",
                              hinttext: "Salary"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 250,
                                controller: jobTitle,
                                Uptext: "Job Title",
                                hinttext: "Job Title"),
                          )
                        ],
                      ),
                    ),
                    //ddddddddddddd
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Dropdownallteacher(
                            title: "Gender",
                            type: "GenderDialog",
                            width: 250,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Dropdownallteacher(
                              title: "Family Status",
                              type: "FamilyStatusDialog",
                              width: 250,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Dropdownallteacher(
                            title: "Contract Type",
                            type: "ContractTypeDialog",
                            width: 250,
                          ),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
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
                              controller: facebook,
                              Uptext: "Facebook URL",
                              hinttext: "Facebook URL"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                width: 250,
                                controller: x,
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
                              controller: linkedin,
                              Uptext: "Linkedin URL",
                              hinttext: "Linkedin URL"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                width: 250,
                                controller: insta,
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
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
                              controller: ifsc,
                              Uptext: "IFSC Code",
                              hinttext: "IFSC Code"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Divider(
                        color: Theme.of(context).primaryColor,
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
                              controller: qualification,
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
                              controller: experience, hinttext: "Experience"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LargeTextField(controller: note, hinttext: "Note"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          apptitle: "Edit Teacher",
          subtitle: "none",
          action: [
            ButtonDialog(
                text: "Edit Employee",
                onPressed: () async {
                  print(control.Birthdate.value);
                  await Editteacherapi.Editteacher(
                    employeeId: teacherId,
                    selectedImage:
                        Get.find<Addteachercontroller>().selectedImage.value,
                    First_Name: firstName.text,
                    Last_Name: lastName.text,
                    Father_Name: fatherName.text,
                    Mother_Name: motherName.text,
                    Phone_Numper: phoneNumber.text,
                    Birth_Date: control.Birthdate.value.toString(),
                    Emergency_Number: emergency.text,
                    Join_Date: control.Joindate.value.toString(),
                    Address: address.text,
                    Current_Address: currentAddress.text,
                    Gender: control.genderDialogIndex,
                    Family_State: control.familyStatusDialogIndex,
                    contractType: control.contractTypeDialogIndex,
                    Facebook_URL: facebook.text,
                    X_Platform_URL: x.text,
                    Linkedin_URL: linkedin.text,
                    Instagram_URL: insta.text,
                    Bank_Account_Title: bankAccountTitle.text,
                    Bank_Name: bankName.text,
                    Bank_Branch_Name: bankBranchName.text,
                    Bank_Account_Number: bankAccountNumber.text,
                    IFSC_Code: ifsc.text,
                    Career_History: careerHistory.text,
                    Qualification: qualification.text,
                    Experience: experience.text,
                    Note: note.text,
                  );
                },
                color: Theme.of(context).primaryColor,
                width: 140)
          ]);
    }),
  );
}
