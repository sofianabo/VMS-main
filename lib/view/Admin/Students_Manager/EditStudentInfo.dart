import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Location_API/Locations_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Update_Student_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/view/Admin/Students_Manager/Edite_Students_Drop_Files.dart';
import 'package:vms_school/widgets/Admin_Students/DropDown_Add_Students.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../../Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';

EditStudentDialog(int idx, BuildContext context) async {
  final Controller = Get.find<Allstudentscontroller>();
  final add_controller = Get.find<Add_Students_Controller>();
  final Allempolyeecontrollers = Get.find<Allempolyeecontroller>();

  Controller.SetIDX(idx);
  TextEditingController First_Name =
      TextEditingController(text: Controller.student!.firstName);
  TextEditingController Last_Name =
      TextEditingController(text: Controller.student!.lastName);
  TextEditingController Place_Of_Birth =
      TextEditingController(text: Controller.student!.placeOfBirth);
  TextEditingController Mobile_Number = TextEditingController(
      text: Controller.filteredStudents[idx].mobileNumber);
  TextEditingController Current_Address =
      TextEditingController(text: Controller.student!.currentAdress);
  TextEditingController National_ID =
      TextEditingController(text: Controller.student!.nationalNumber);
  TextEditingController Password = TextEditingController();
  TextEditingController Father_Name =
      TextEditingController(text: Controller.student!.fatherName);
  TextEditingController Mother_Name =
      TextEditingController(text: Controller.student!.motherName);
  TextEditingController Father_Phone =
      TextEditingController(text: Controller.student!.fatherPhone);
  TextEditingController Father_Work =
      TextEditingController(text: Controller.student!.fatherWork);
  TextEditingController Mother_Phone =
      TextEditingController(text: Controller.student!.motherPhone);
  TextEditingController Mother_Work =
      TextEditingController(text: Controller.student!.motherWork);
  TextEditingController Last_School_Detail =
      TextEditingController(text: Controller.student!.lastSchoolDetail);
  TextEditingController LocalID =
      TextEditingController(text: Controller.student!.localID);
  TextEditingController Note =
      TextEditingController(text: Controller.student!.note);
  TextEditingController Fee_Discount =
      TextEditingController(text: Controller.student!.feeDiscount);
  TextEditingController username =
      TextEditingController(text: Controller.filteredStudents[idx].userName);

  add_controller.selectedImage.value = null;
  add_controller.set_Edite_Data(
      DivisionIndexs: Controller.student!.division!.enName,
      isPendStudents: Controller.student!.isPended,
      BloodTypeindex: Controller.student!.bloodType,
      Classindex: Controller.student!.classes!.enName ?? "",
      FamilyStateindex: Controller.student!.familystatus ?? "",
      Genderindex: Controller.student!.gender ?? "",
      Locationindex: Controller.student!.location!.enName ?? "",
      Specialneed: Controller.student!.specialNeeds == 1 ? true : false,
      Martyson: Controller.student!.martyrSon == 1 ? true : false,
      Realagonindex: Controller.student!.religion ?? "");
  Allempolyeecontrollers.Birthdate.value =
      DateTime.parse(Controller.student!.birthDate.toString());

  Get.dialog(VMSAlertDialog(
      action: [
        ButtonDialog(
            text: "Update Student",
            onPressed: () async {
              await Update_Student_API.Update_Student(
                  Academic_sequence_FileID:
                      Controller.student!.documantes!.academicSequence?.id,
                  Certefecate_FileID:
                      Controller.student!.documantes!.certificate?.id,
                  FamilyNotbook_FileID:
                      Controller.student!.documantes!.familyNotebook?.id,
                  FatherPassport_FileID:
                      Controller.student!.documantes!.fatherPassport?.id,
                  MotherPassport_FileID:
                      Controller.student!.documantes!.motherPassport?.id,
                  SonPassport_FileID:
                      Controller.student!.documantes!.sonPassport?.id,
                  studentID: Controller.filteredStudents[idx].id,
                  UserID_FileID: Controller.student!.documantes!.userID?.id,
                  locationId: Get.find<Location_controller>()
                      .location![add_controller.Locationlist.indexOf(
                          add_controller.LocationIndex)]
                      .id,
                  firstName: First_Name.text,
                  lastName: Last_Name.text,
                  gender: add_controller.GenderIndex,
                  birthDate: Get.find<Allempolyeecontroller>().Birthdate.value,
                  placeOfBirth: Place_Of_Birth.text,
                  religion: add_controller.RealagonIndex,
                  mobileNumber: Mobile_Number.text,
                  bloodType: add_controller.BloodTypeIndex,
                  fatherName: Father_Name.text,
                  fatherPhone: Father_Phone.text,
                  motherName: Mother_Name.text,
                  currentAdress: Current_Address.text,
                  familystatus: add_controller.FamilyStateIndex,
                  password: Password.text,
                  classid: Get.find<Dropdownclassescontroller>()
                      .Allclass[add_controller.Classlist.indexOf(
                          add_controller.ClassIndex)]
                      .id,
                  divisionId: Get.find<Dropdowndivisioncontroller>()
                      .allDivision[add_controller.Divisionlist.indexOf(add_controller.DivisionIndex)]
                      .id,
                  fatherWork: Father_Work.text,
                  motherPhone: Mother_Phone.text,
                  motherWork: Mother_Work.text,
                  nationalNumber: National_ID.text,
                  localID: LocalID.text,
                  lastSchoolDetail: Last_School_Detail.text,
                  note: Note.text,
                  Fee_Discount: Fee_Discount.text,
                  specialNeeds: add_controller.isSpecialNeed.value,
                  martyrSon: add_controller.isMartySon.value,
                  FatherPassport: add_controller.selectedFatherPassport.value,
                  MotherPassport: add_controller.selectedMotherPassport.value,
                  SonPassport: add_controller.selectedSonPassport.value,
                  UserID: add_controller.selectedId.value,
                  Certefecate: add_controller.selectedCertificate.value,
                  Ispend: add_controller.isPendStudent.value,
                  Academic_sequence: add_controller.selectedtsalsol.value,
                  FamilyNotbook: add_controller.selectedFamilyBook.value,
                  file: add_controller.selectedImage.value);
            },
            color: Get.theme.primaryColor,
            width: 120)
      ],
      contents: Edite_Students_page(
        First_Name: First_Name,
        Last_Name: Last_Name,
        Place_Of_Birth: Place_Of_Birth,
        Mobile_Number: Mobile_Number,
        Current_Address: Current_Address,
        National_ID: National_ID,
        Password: Password,
        Father_Name: Father_Name,
        Mother_Name: Mother_Name,
        Father_Phone: Father_Phone,
        Father_Work: Father_Work,
        Mother_Phone: Mother_Phone,
        Mother_Work: Mother_Work,
        Last_School_Detail: Last_School_Detail,
        Note: Note,
        LocalID: LocalID,
        Fee_Discount: Fee_Discount,
        username: username,
      ),
      apptitle: "Edite Student",
      subtitle: "Edite ${Controller.filteredStudents[idx].fullName} Info"));
  await Getallclassapi.getAllClasses();
  await Get_Location_API.Get_Locations();
  add_controller.initialdata();
  add_controller.SetIsLoadingDivision(true);
  await Dropdowndivisionapi(context).Dropdowndivision(
      add_controller.Classlist.indexOf(
          Controller.student!.classes!.enName.toString()),
      idx);
  add_controller.SetDivision(
      division: Controller.filteredStudents[idx].division!.enName.toString());
}

class Edite_Students_page extends StatefulWidget {
  Edite_Students_page({
    super.key,
    required this.First_Name,
    required this.Last_Name,
    required this.Place_Of_Birth,
    required this.Mobile_Number,
    required this.Current_Address,
    required this.National_ID,
    required this.Password,
    required this.Father_Name,
    required this.Mother_Name,
    required this.Father_Phone,
    required this.Father_Work,
    required this.Mother_Phone,
    required this.Mother_Work,
    required this.LocalID,
    required this.Last_School_Detail,
    required this.Note,
    required this.Fee_Discount,
    required this.username,
  });

  TextEditingController First_Name;
  TextEditingController Last_Name;
  TextEditingController Place_Of_Birth;
  TextEditingController Mobile_Number;
  TextEditingController LocalID;
  TextEditingController Current_Address;
  TextEditingController National_ID;
  TextEditingController Password;
  TextEditingController Father_Name;
  TextEditingController Mother_Name;
  TextEditingController Father_Phone;
  TextEditingController Father_Work;
  TextEditingController Mother_Phone;
  TextEditingController Mother_Work;
  TextEditingController Last_School_Detail;
  TextEditingController Note;
  TextEditingController Fee_Discount;
  TextEditingController username;

  @override
  State<Edite_Students_page> createState() => _Edite_Students_pageState();
}

class _Edite_Students_pageState extends State<Edite_Students_page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<Add_Students_Controller>(builder: (controller) {
          return Expanded(
            child: SizedBox(
              width: 620,
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
                                  maxRadius: 100,
                                  backgroundColor: const Color(0xffC4C4C4),
                                  backgroundImage: controller
                                              .selectedImage.value !=
                                          null
                                      ? MemoryImage(
                                          controller.selectedImage.value!)
                                      : Get.find<Allstudentscontroller>()
                                                  .filteredStudents[Get.find<
                                                          Allstudentscontroller>()
                                                      .idx]
                                                  .fileId !=
                                              null
                                          ? NetworkImage(getimage +
                                              "${Get.find<Allstudentscontroller>().filteredStudents[Get.find<Allstudentscontroller>().idx].fileId}")
                                          : null,
                                  child: controller.selectedImage.value ==
                                              null &&
                                          Get.find<Allstudentscontroller>()
                                                  .filteredStudents[Get.find<
                                                          Allstudentscontroller>()
                                                      .idx]
                                                  .fileId ==
                                              null
                                      ? Text(
                                          Get.find<Allstudentscontroller>()
                                              .filteredStudents[Get.find<
                                                      Allstudentscontroller>()
                                                  .idx]
                                              .fullName!
                                              .substring(0, 1)
                                              .toUpperCase(),
                                          style: Get.textTheme.titleLarge!
                                              .copyWith(
                                            fontSize: 42,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.First_Name,
                              Uptext: "First Name",
                              hinttext: "First Name",
                              onChanged: (value) {
                                controller.updateFirstName(value);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 22.0),
                              child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                controller: widget.Last_Name,
                                Uptext: "Last Name",
                                hinttext: "Last Name",
                                onChanged: (value) {
                                  controller.updateLastName(value);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.Place_Of_Birth,
                              Uptext: "Place Of Birth",
                              hinttext: "Place Of Birth"),
                          Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: BirthDate(
                                isRequired: true,
                                Uptext: "Birthdate",
                                width: 300,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              title: "Gender",
                              width: 300,
                              type: "Gender"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: DropdownAddStudents(
                                isLoading: false,
                                title: "Realagon",
                                width: 300,
                                type: "Realagon"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              title: "Blood Type",
                              width: 300,
                              type: "BloodType"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: DropdownAddStudents(
                                isLoading: controller.isLoadingLocation,
                                title: "Location",
                                width: 300,
                                type: "Location"),
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
                              width: 300,
                              controller: widget.Mobile_Number,
                              Uptext: "Mobile Number",
                              hinttext: "Mobile Number"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                controller: widget.LocalID,
                                Uptext: "Local ID",
                                hinttext: "Local ID"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: false,
                              title: "Family State",
                              width: 620,
                              type: "FamilyState"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: false,
                              width: 300,
                              controller: widget.National_ID,
                              Uptext: "National Id",
                              hinttext: "National Id"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                controller: widget.Current_Address,
                                Uptext: "Current Address",
                                hinttext: "Current Address"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                            value:
                                                controller.isSpecialNeed.value,
                                            onChanged: (value) {
                                              controller
                                                  .toggleSpecialNeed(value!);
                                            },
                                          )),
                                      Text("Special need",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Obx(() => Checkbox(
                                            value: controller.isMartySon.value,
                                            onChanged: (value) {
                                              controller.toggleMartySon(value!);
                                            },
                                          )),
                                      Text("Marty son",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                ]),
                            Row(
                              children: [
                                Obx(() => Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              backgroundColor: controller
                                                      .isPendStudent.value
                                                  ? Get.theme.primaryColor
                                                  : Get.theme.disabledColor),
                                          onPressed: () {
                                            if (!controller
                                                .isPendStudent.value) {
                                              Get.defaultDialog(
                                                radius: 5,
                                                contentPadding:
                                                    EdgeInsets.all(20.0),
                                                title: "Pend Student",
                                                middleText:
                                                    "Do You Want To Pend (${widget.First_Name.text} ${widget.Last_Name.text}) Student?",
                                                confirm: ElevatedButton(
                                                  onPressed: () {
                                                    controller
                                                        .togglePindStudent(
                                                            true);
                                                    Get.back();
                                                  },
                                                  child: Text("Yes"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(0xffB03D3D),
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                                cancel: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text("No"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Get.theme
                                                                  .primaryColor,
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                              );
                                            } else {
                                              Get.defaultDialog(
                                                title: "UnPend Student",
                                                radius: 5,
                                                contentPadding:
                                                    EdgeInsets.all(20.0),
                                                middleText:
                                                    "Do You Want To UnPend ( ${widget.First_Name.text} ${widget.Last_Name.text} ) Student ?",
                                                confirm: ElevatedButton(
                                                  onPressed: () {
                                                    controller
                                                        .togglePindStudent(
                                                            false);
                                                    Get.back();
                                                  },
                                                  child: Text("Yes"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color(0xffB03D3D),
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                                cancel: ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text("No"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Get.theme
                                                                  .primaryColor,
                                                          foregroundColor:
                                                              Colors.white),
                                                ),
                                              );
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                  color: Colors.white,
                                                  controller.isPendStudent.value
                                                      ? Icons.lock_open_outlined
                                                      : Icons.lock),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, right: 8.0),
                                                child: Text(
                                                  controller.isPendStudent.value
                                                      ? "UnPend This Student"
                                                      : "Pend Student",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Student School Info   ",
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownAddStudents(
                              isLoading: controller.isLoadingClass,
                              title: "Class",
                              width: 300,
                              type: "Class"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: DropdownAddStudents(
                                isLoading: controller.isLoadingDivision,
                                isDisabled:
                                    controller.ClassIndex == "" ? true : false,
                                title: "Division",
                                width: 300,
                                type: "Division"),
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
                            isRequired: true,
                            width: 300,
                            controller: widget.username,
                            Uptext: "Username",
                            hinttext: "Username",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                controller: widget.Password,
                                Uptext: "Password",
                                hinttext: "Password"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: false,
                              width: 300,
                              controller: widget.Fee_Discount,
                              Uptext: "Fee Discount",
                              hinttext: "Fee Discount")
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Father Info   ",
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.Father_Name,
                              Uptext: "Father Name",
                              hinttext: "Father Name"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                isRequired: true,
                                width: 300,
                                controller: widget.Father_Phone,
                                Uptext: "Father Phone",
                                hinttext: "Father Phone"),
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
                              width: 300,
                              controller: widget.Father_Work,
                              Uptext: "Father Work",
                              hinttext: "Father Work"),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Mother Info   ",
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Textfildwithupper(
                              isRequired: true,
                              width: 300,
                              controller: widget.Mother_Name,
                              Uptext: "Mother Name",
                              hinttext: "Mother Name"),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Textfildwithupper(
                                isRequired: false,
                                width: 300,
                                controller: widget.Mother_Phone,
                                Uptext: "Mother Phone",
                                hinttext: "Mother Phone"),
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
                              width: 300,
                              controller: widget.Mother_Work,
                              Uptext: "Mother Work",
                              hinttext: "Mother Work"),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   More Info   ",
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LargeTextField(
                              width: 620,
                              controller: widget.Last_School_Detail,
                              hinttext: "Last School Detail"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LargeTextField(
                              width: 620,
                              controller: widget.Note,
                              hinttext: "Note"),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   File Data   ",
                              style: Get.theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Get.theme.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Drop_Edite_students()
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
