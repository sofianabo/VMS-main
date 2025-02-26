import 'package:dio/dio.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Add_Students_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Location_API/Locations_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Functions/Students_Illness_Funcation.dart';
import 'package:vms_school/Link/Functions/Students_Vaccines_Funcation.dart';
import 'package:vms_school/Link/Model/AdminModel/allGuardianModel.dart';
import 'package:vms_school/widgets/Admin_Students/DropDown_Add_Students.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

Add_Students_Dialog_Functions() async {
  final Allgaurdiancontroller c = Get.find<Allgaurdiancontroller>();
  Dio dio = Dio();
  try {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    c.setIsLoading(true);
    String myurl = "${hostPort}${getguardians}";
    var response = await dio.get(
        cancelToken: cancelToken, myurl, options: getDioOptions());
    if (response.statusCode == 200) {
      AllGuardianModel classes = AllGuardianModel.fromJson(response.data);
      c.setallGaurdian(classes);
      Get.back();
      Get_Location_API.Get_Locations();
      Get.dialog(All_Gurdians_Dialog());
    } else {
      ErrorHandler.handleDioError(DioError(
        requestOptions: response.requestOptions,
        response: response,
        type: DioErrorType.badResponse,
      ));
    }
  } catch (e) {
    if (e is DioError) {
      ErrorHandler.handleDioError(e);
    } else if (e is Exception) {
      ErrorHandler.handleException(e);
    } else {
      ErrorHandler.handleException(Exception(e.toString()));
    }
  }
}

All_Gurdians_Dialog() {
  Getallclassapi.getAllClasses();
  TextEditingController search = TextEditingController();
  TextEditingController First_Name = TextEditingController();
  TextEditingController Last_Name = TextEditingController();
  TextEditingController Place_Of_Birth = TextEditingController();
  TextEditingController Mobile_Number = TextEditingController();
  TextEditingController Current_Address = TextEditingController();
  TextEditingController National_ID = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Father_Name = TextEditingController();
  TextEditingController Mother_Name = TextEditingController();
  TextEditingController Father_Phone = TextEditingController();
  TextEditingController Father_Work = TextEditingController();
  TextEditingController Mother_Phone = TextEditingController();
  TextEditingController Mother_Work = TextEditingController();
  TextEditingController Last_School_Detail = TextEditingController();
  TextEditingController LocalID = TextEditingController();
  TextEditingController Note = TextEditingController();
  TextEditingController Fee_Discount = TextEditingController();
  final addStudentsController = Get.put(Add_Students_Controller());
  final class_controller = Get.find<Dropdownclassescontroller>();
  addStudentsController.resetData();
  return VMSAlertDialog(
    action: [
      Obx(() {
        BuildContext context;
        return addStudentsController.currentPage.value == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonDialog(
                    text: "Back",
                    onPressed: () {
                      addStudentsController.goToPage(0);
                    },
                    color: Get.theme.primaryColor,
                    width: 100,
                  ),
                  ButtonDialog(
                    text: "Add Students",
                    onPressed: () async {
                      await Add_Student_API.Add_Student(
                          locationId: Get.find<Location_controller>()
                              .location![addStudentsController.Locationlist.indexOf(
                                  addStudentsController.LocationIndex)]
                              .id,
                          firstName: First_Name.text,
                          lastName: Last_Name.text,
                          gender: addStudentsController.GenderIndex,
                          birthDate:
                              Get.find<Allempolyeecontroller>().Birthdate.value,
                          placeOfBirth: Place_Of_Birth.text,
                          religion: addStudentsController.RealagonIndex,
                          mobileNumber: Mobile_Number.text,
                          bloodType: addStudentsController.BloodTypeIndex,
                          fatherName: Father_Name.text,
                          fatherPhone: Father_Phone.text,
                          motherName: Mother_Name.text,
                          currentAdress: Current_Address.text,
                          familystatus: addStudentsController.FamilyStateIndex,
                          guardianId:
                              Get.find<Allgaurdiancontroller>().garduansid,
                          userName: addStudentsController.textController.text,
                          password: Password.text,
                          classid: class_controller
                              .Allclass[addStudentsController.Classlist.indexOf(
                                  addStudentsController.ClassIndex)]
                              .id,
                          divisionId: Get.find<Dropdowndivisioncontroller>()
                              .allDivision[
                                  addStudentsController.Divisionlist.indexOf(
                                      addStudentsController.DivisionIndex)]
                              .id,
                          fatherWork: Father_Work.text,
                          motherPhone: Mother_Phone.text,
                          motherWork: Mother_Work.text,
                          nationalNumber: National_ID.text,
                          localID: LocalID.text,
                          lastSchoolDetail: Last_School_Detail.text,
                          note: Note.text,
                          Fee_Discount: Fee_Discount.text,
                          specialNeeds:
                              addStudentsController.isSpecialNeed.value,
                          martyrSon: addStudentsController.isMartySon.value,
                          FatherPassport:
                              addStudentsController.selectedFatherPassport.value,
                          MotherPassport: addStudentsController.selectedMotherPassport.value,
                          SonPassport: addStudentsController.selectedSonPassport.value,
                          UserID: addStudentsController.selectedId.value,
                          Certefecate: addStudentsController.selectedCertificate.value,
                          Academic_sequence: addStudentsController.selectedtsalsol.value,
                          FamilyNotbook: addStudentsController.selectedFamilyBook.value,
                          illness: Get.find<Illness_Controller>().files,
                          vaccine: Get.find<Vaccines_Controller>().files,
                          file: addStudentsController.selectedImage.value);
                    },
                    color: Get.theme.primaryColor,
                    width: 100,
                  ),
                ],
              )
            : SizedBox();
      }),
    ],
    contents: Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: SizedBox(
        width: 700,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          allowImplicitScrolling: false,
          scrollDirection: Axis.horizontal,
          controller: addStudentsController.pageController,
          onPageChanged: (index) {
            addStudentsController.currentPage.value = index;
          },
          children: [
            GetBuilder<Allgaurdiancontroller>(builder: (control) {
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              control.clearFilter();
                            },
                            onchange: (value) {
                              control.searchGaurdian(value);
                            },
                            width: 680,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          )),
                    ],
                  ),
                  Expanded(
                      child: GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.8),
                    itemCount: control.filteredregaurdians!.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () {
                            control.garduansid = control
                                .filteredregaurdians![index].id
                                .toString();
                            addStudentsController.goToPage(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              color: Theme.of(context).cardColor,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${control.filteredregaurdians![index].name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "${control.filteredregaurdians![index].userName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Email: ${control.filteredregaurdians![index].email}",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!,
                                ),
                                Text(
                                  "Mobile Number : ${control.filteredregaurdians![index].phone}",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              );
            }),
            Add_Students_page(
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
            ),
          ],
        ),
      ),
    ),
    apptitle: "Add Students",
    subtitle: "Select Garduans To Add Students",
  );
}

class Add_Students_page extends StatefulWidget {
  Add_Students_page({
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

  @override
  State<Add_Students_page> createState() => _Add_Students_pageState();
}

class _Add_Students_pageState extends State<Add_Students_page> {
  final countryPicker = const FlCountryCodePicker();
  DropzoneViewController? ctrl;
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(fontSize: 16)),
                                    ],
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GetBuilder<Illness_Controller>(
                                      builder: (Ill_Controller) {
                                    return ButtonDialog(
                                        height: 60,
                                        text:
                                            "Student Illness (${Ill_Controller.selectedIllnesses.length})",
                                        onPressed: () async {
                                          await Students_Illness_Funcation(
                                              context);
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 145);
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: GetBuilder<Vaccines_Controller>(
                                        builder: (vac_Controller) {
                                      return ButtonDialog(
                                          height: 60,
                                          text:
                                              "Student Vaccines (${vac_Controller.selectedIllnesses.length})",
                                          onPressed: () async {
                                            await Students_Vaccines_Funcation(
                                                context);
                                          },
                                          color: Theme.of(context).primaryColor,
                                          width: 145);
                                    }),
                                  ),
                                ]),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Student School Info   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
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
                            isRequired: true,
                            width: 300,
                            controller: controller.textController,
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
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Father Info   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
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
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   Mother Info   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
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
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   More Info   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
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
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              ),
                            ),
                            Text(
                              "   File Data   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Father Passport"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickFatherPassport();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller
                                                  .isHoveringFatherPassport ||
                                              controller.selectedFatherPassport
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverFather(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverFather(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedFatherPassport
                                                  .value = fileBytes;
                                              controller.FatherPassportName
                                                  .value = fileName!;
                                              controller.updateTextFather(
                                                  "File Father Passport Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller
                                                      .selectedFatherPassport
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .ClearselectedFatherPassport();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller
                                                      .FatherPassportStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringFatherPassport
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Mother Passport"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickMotherPassport();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller
                                                  .isHoveringMotherPassport ||
                                              controller.selectedMotherPassport
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverMother(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverMother(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedMotherPassport
                                                  .value = fileBytes;
                                              controller.MotherPassportName
                                                  .value = fileName!;
                                              controller.updateTextMother(
                                                  "File Mother Passport Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller
                                                      .selectedMotherPassport
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .ClearselectedMotherPassport();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller
                                                      .MotherPassportStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringMotherPassport
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Son Passport"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickSonPassport();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringSonPassport ||
                                              controller.selectedSonPassport
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverSon(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverSon(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedSonPassport
                                                  .value = fileBytes;
                                              controller.SonPassportName.value =
                                                  fileName!;
                                              controller.updateTextSon(
                                                  "File Son Passport Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedSonPassport
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.Clear_Son();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.SonPassportStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringSonPassport
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add ID File"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickId();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringId ||
                                              controller.selectedId.value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHoverId(true);
                                          },
                                          onLeave: () {
                                            controller.updateHoverId(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedId.value =
                                                  fileBytes;
                                              controller.IdName.value =
                                                  fileName!;
                                              controller.updateTextId(
                                                  "File Id Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedId.value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.Clear_id();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.IdStatus,
                                                  style: TextStyle(
                                                    color:
                                                        controller.isHoveringId
                                                            ? Colors.white
                                                            : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Certificate"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.pickCertificate();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringCertificate ||
                                              controller.selectedCertificate
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller
                                                .updateHoverCertificate(true);
                                          },
                                          onLeave: () {
                                            controller
                                                .updateHoverCertificate(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedCertificate
                                                  .value = fileBytes;
                                              controller.CertificateName.value =
                                                  fileName!;
                                              controller.updateTextCertificate(
                                                  "File Certificate Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedCertificate
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .Clear_Certificate();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.CertificateStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringCertificate
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Add Academic sequence"),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.picktsalsol();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringtsalsol ||
                                              controller
                                                      .selectedtsalsol.value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller.updateHovertsalsol(true);
                                          },
                                          onLeave: () {
                                            controller
                                                .updateHovertsalsol(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedtsalsol.value =
                                                  fileBytes;
                                              controller.tsalsolName.value =
                                                  fileName!;
                                              controller.updateTexttsalsol(
                                                  "File Academic sequence Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller
                                                      .selectedtsalsol.value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.Clear_tasalsol();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.tsalsolStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringtsalsol
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Add Family notebook"),
                                GestureDetector(
                                  onTap: () {
                                    controller.pickFamilyBook();
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: Color(0xffD9D9D9)),
                                      color: controller.isHoveringFamilyBook ||
                                              controller.selectedFamilyBook
                                                      .value !=
                                                  null
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    width: 300,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        DropzoneView(
                                          operation: DragOperation.copy,
                                          cursor: CursorType.Default,
                                          onCreated: (DropzoneViewController
                                              controller) {
                                            ctrl = controller;
                                          },
                                          onHover: () {
                                            controller
                                                .updateHoverFamilyBook(true);
                                          },
                                          onLeave: () {
                                            controller
                                                .updateHoverFamilyBook(false);
                                          },
                                          onDropFiles:
                                              (List<DropzoneFileInterface>?
                                                  files) async {
                                            if (files != null &&
                                                files.length == 1) {
                                              final file = files.first;
                                              final fileName =
                                                  await ctrl?.getFilename(file);
                                              final fileBytes =
                                                  await ctrl?.getFileData(file);

                                              controller.selectedFamilyBook
                                                  .value = fileBytes;
                                              controller.FamilyBookName.value =
                                                  fileName!;
                                              controller.updateTextFamilyBook(
                                                  "File Family notebook Dropped!");
                                            }
                                          },
                                        ),
                                        Center(
                                          child: controller.selectedFamilyBook
                                                      .value !=
                                                  null
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .Clear_FamilyBook();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: Colors.white,
                                                  ))
                                              : Text(
                                                  textAlign: TextAlign.center,
                                                  controller.FamilyBookStatus,
                                                  style: TextStyle(
                                                    color: controller
                                                            .isHoveringFamilyBook
                                                        ? Colors.white
                                                        : Color(0xffCBBFBF),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
