import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Add_Students_Controller extends GetxController {
  List<String> Genderlist = ["Male", "Female"];
  List<String> Realagonlist = ["Muslim", "Christianity"];
  List<String> BloodTypelist = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];
  List<String> FamilyStatelist = ["Widow", "Single", "Married", "Divorced"];

  List<String> Locationlist = [];
  List<String> Classlist = [];
  List<String> Divisionlist = [];

  var isSpecialNeed = false.obs;
  var isMartySon = false.obs;
  var isPendStudent = false.obs;

  void togglePindStudent(bool value) {
    isPendStudent.value = value;
  }

  set_Edite_Data(
      {Genderindex,
      Realagonindex,
      BloodTypeindex,
      Locationindex,
      FamilyStateindex,
      Classindex,
      Specialneed,
      DivisionIndexs,
      required isPendStudents,
      Martyson}) {
    GenderIndex = Genderindex;
    RealagonIndex = Realagonindex;
    BloodTypeIndex = BloodTypeindex;
    LocationIndex = Locationindex;
    FamilyStateIndex = FamilyStateindex;
    ClassIndex = Classindex;
    DivisionIndex = DivisionIndexs;
    isSpecialNeed.value = Specialneed;
    isPendStudent.value = isPendStudents;
    isMartySon.value = Martyson;
    update();
  }

  SetDivision({division}) {
    DivisionIndex = division;
    update();
  }

  void toggleSpecialNeed(bool value) {
    isSpecialNeed.value = value;
  }

  void toggleMartySon(bool value) {
    isMartySon.value = value;
  }

  String GenderIndex = "";
  String RealagonIndex = "";
  String BloodTypeIndex = "";
  String LocationIndex = "";
  String FamilyStateIndex = "Single";
  String ClassIndex = "";
  String DivisionIndex = "";

  bool isLoadingLocation = true;
  bool isLoadingClass = true;
  bool isLoadingDivision = true;

  var firstName = ''.obs;
  var lastName = ''.obs;
  var username = ''.obs;

  void resetData() {
    GenderIndex = "";
    RealagonIndex = "";
    BloodTypeIndex = "";
    LocationIndex = "Syria";
    FamilyStateIndex = "Single";
    ClassIndex = "";

    DivisionIndex = "";
    firstName.value = "";
    lastName.value = "";
    username.value = "";
    currentPage.value = 0;
    isSpecialNeed.value = false;
    isMartySon.value = false;
    isPendStudent.value = false;
    textController.clear();
    update();
  }

  void updateUsername() {
    String combinedName =
        '${firstName.value.trim()}${lastName.value.trim()}'.replaceAll(' ', '');

    if (isArabic(combinedName)) {
      combinedName = arabicToLatin(combinedName);
    }

    username.value = '$combinedName'.toLowerCase();
    textController.text = username.value;
    update();
  }

  bool isArabic(String text) {
    return text.codeUnits.any((unit) => unit >= 0x0600 && unit <= 0x06FF);
  }

  String arabicToLatin(String arabicText) {
    final Map<String, String> arabicToLatinMap = {
      'ا': 'a',
      'أ': 'a',
      'آ': 'a',
      'إ': 'e',
      'ب': 'b',
      'ت': 't',
      'ث': 'th',
      'ج': 'j',
      'ح': 'h',
      'خ': 'kh',
      'د': 'd',
      'ذ': 'dh',
      'ر': 'r',
      'ز': 'z',
      'س': 's',
      'ش': 'sh',
      'ص': 's',
      'ض': 'd',
      'ط': 't',
      'ظ': 'dh',
      'ع': 'a',
      'غ': 'gh',
      'ف': 'f',
      'ق': 'q',
      'ك': 'k',
      'ل': 'l',
      'م': 'm',
      'ن': 'n',
      'ه': 'h',
      'و': 'w',
      'ي': 'y',
      'ى': 'a',
      'ة': 'a',
      'ء': 'a',
      'ؤ': 'oa',
      'ئ': 'aa',
      'َ': 'a',
      'ُ': 'o',
      'ِ': 'e',
      'ّ': '',
      'ْ': '',
      '~': '',
      ' ': '',
    };

    String result = '';
    for (int i = 0; i < arabicText.length; i++) {
      String char = arabicText[i];
      result += arabicToLatinMap[char] ?? char;
    }
    return result;
  }

  void updateFirstName(String value) {
    firstName.value = value.trim();
    updateUsername();
  }

  void updateLastName(String value) {
    lastName.value = value.trim();
    updateUsername();
  }

  final TextEditingController textController = TextEditingController();

  SetIsLoadingLocation(bool value) {
    isLoadingLocation = value;
    update();
  }

  SetIsLoadingClass(bool value) {
    isLoadingClass = value;
    update();
  }

  SetIsLoadingDivision(bool value) {
    DivisionIndex = "";
    isLoadingDivision = value;
    update();
  }

  SetLocationlist(List<String> data) {
    Locationlist = data;
    SetIsLoadingLocation(false);
    update();
  }

  SetClasslist(List<String> data) {
    Classlist = data;
    SetIsLoadingClass(false);
    update();
  }

  SetDivisionlist(List<String> data) {
    Divisionlist = data;
    SetIsLoadingDivision(false);
    update();
  }

  var currentPage = 0.obs;
  PageController pageController = PageController();

  void goToPage(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Gender':
        GenderIndex = index ?? "";
        break;

      case 'Realagon':
        RealagonIndex = index ?? "";
        break;

      case 'BloodType':
        BloodTypeIndex = index ?? "";
        break;

      case 'Location':
        LocationIndex = index ?? "";
        break;

      case 'FamilyState':
        FamilyStateIndex = index ?? "";
        break;

      case 'Class':
        ClassIndex = index ?? "";
        break;

      case 'Division':
        DivisionIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'Gender':
        Genderlist = options;
        break;
      case 'Realagon':
        Realagonlist = options;
        break;
      case 'BloodType':
        BloodTypelist = options;
        break;
      case 'Location':
        Locationlist = options;
        break;
      case 'FamilyState':
        FamilyStatelist = options;
        break;
      case 'Class':
        Classlist = options;
        break;
      case 'Division':
        Divisionlist = options;
        break;
    }
    update();
  }

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      selectedImage.value = fileBytes;
    } else {}
  }

  bool isHoveringFatherPassport = false;
  String FatherPassportStatus =
      "Click To Add Father Passport\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedFatherPassport = Rx<Uint8List?>(null);
  RxString FatherPassportName = "".obs;
  Future<void> pickFatherPassport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedFatherPassport.value = result.files.single.bytes;
      FatherPassportName.value = result.files.single.name;

      updateTextFather("Done Selected File");
    }
  }

  void updateHoverFather(bool value) {
    isHoveringFatherPassport = value;
    update();
  }

  void updateTextFather(String value) {
    FatherPassportStatus = value;
    update();
  }

  bool isHoveringMotherPassport = false;
  String MotherPassportStatus =
      "Click To Add Mother Passport\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedMotherPassport = Rx<Uint8List?>(null);
  RxString MotherPassportName = "".obs;
  Future<void> pickMotherPassport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedMotherPassport.value = result.files.single.bytes;
      MotherPassportName.value = result.files.single.name;

      updateTextMother("Done Selected File");
    }
  }

  void updateHoverMother(bool value) {
    isHoveringMotherPassport = value;
    update();
  }

  void updateTextMother(String value) {
    MotherPassportStatus = value;
    update();
  }

  bool isHoveringSonPassport = false;
  String SonPassportStatus =
      "Click To Add Son Passport\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedSonPassport = Rx<Uint8List?>(null);
  RxString SonPassportName = "".obs;
  Future<void> pickSonPassport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedSonPassport.value = result.files.single.bytes;
      SonPassportName.value = result.files.single.name;

      updateTextSon("Done Selected File");
    }
  }

  void updateHoverSon(bool value) {
    isHoveringSonPassport = value;
    update();
  }

  void updateTextSon(String value) {
    SonPassportStatus = value;
    update();
  }

  bool isHoveringId = false;
  String IdStatus = "Click To Add Id\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedId = Rx<Uint8List?>(null);
  RxString IdName = "".obs;
  Future<void> pickId() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedId.value = result.files.single.bytes;
      IdName.value = result.files.single.name;

      updateTextId("Done Selected File");
    }
  }

  void updateHoverId(bool value) {
    isHoveringId = value;
    update();
  }

  void updateTextId(String value) {
    IdStatus = value;
    update();
  }

  bool isHoveringCertificate = false;
  String CertificateStatus =
      "Click To Add Certificate\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedCertificate = Rx<Uint8List?>(null);
  RxString CertificateName = "".obs;
  Future<void> pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedCertificate.value = result.files.single.bytes;
      CertificateName.value = result.files.single.name;

      updateTextCertificate("Done Selected File");
    }
  }

  void updateHoverCertificate(bool value) {
    isHoveringCertificate = value;
    update();
  }

  void updateTextCertificate(String value) {
    CertificateStatus = value;
    update();
  }

  bool isHoveringtsalsol = false;
  String tsalsolStatus =
      "Click To Add Academic sequence\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedtsalsol = Rx<Uint8List?>(null);
  RxString tsalsolName = "".obs;
  Future<void> picktsalsol() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedtsalsol.value = result.files.single.bytes;
      tsalsolName.value = result.files.single.name;

      updateTexttsalsol("Done Selected File");
    }
  }

  void updateHovertsalsol(bool value) {
    isHoveringtsalsol = value;
    update();
  }

  void updateTexttsalsol(String value) {
    tsalsolStatus = value;
    update();
  }

  bool isHoveringFamilyBook = false;
  String FamilyBookStatus =
      "Click To Add Family notebook\nOr\nDrag And Drop File Here";

  Rx<Uint8List?> selectedFamilyBook = Rx<Uint8List?>(null);
  RxString FamilyBookName = "".obs;
  Future<void> pickFamilyBook() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.bytes != null) {
      selectedFamilyBook.value = result.files.single.bytes;
      FamilyBookName.value = result.files.single.name;

      updateTextFamilyBook("Done Selected File");
    }
  }

  void updateHoverFamilyBook(bool value) {
    isHoveringFamilyBook = value;
    update();
  }

  void updateTextFamilyBook(String value) {
    FamilyBookStatus = value;
    update();
  }

  String get selectedGenderIndex => GenderIndex;
  String get selectedRealagonIndex => RealagonIndex;
  String get selectedBloodTypeIndex => BloodTypeIndex;
  String get selectedLocationIndex => LocationIndex;
  String get selectedFamilyStateIndex => FamilyStateIndex;
  String get selectedClassIndex => ClassIndex;
  String get selectedDivisionIndex => DivisionIndex;

  void ClearselectedFatherPassport() {
    selectedFatherPassport.value = null;
    updateHoverFather(false);

    updateTextFather(
        "Click To Add Father Passport\nOr\nDrag And Drop File Here");
    update();
  }

  void ClearselectedMotherPassport() {
    selectedMotherPassport.value = null;
    updateHoverMother(false);
    updateTextMother(
        "Click To Add Mother Passport\nOr\nDrag And Drop File Here");
    update();
  }

  void Clear_Son() {
    selectedSonPassport.value = null;
    updateHoverSon(false);
    updateTextSon("Click To Add Son Passport\nOr\nDrag And Drop File Here");
    update();
  }

  void Clear_id() {
    selectedId.value = null;
    updateHoverId(false);
    updateTextId("Click To Add Id\nOr\nDrag And Drop File Here");
    update();
  }

  void Clear_Certificate() {
    selectedCertificate.value = null;
    updateHoverCertificate(false);
    updateTextCertificate(
        "Click To Add Certificate\nOr\nDrag And Drop File Here");
    update();
  }

  void Clear_tasalsol() {
    selectedtsalsol.value = null;
    updateHovertsalsol(false);
    updateTexttsalsol(
        "Click To Add Academic sequence\nOr\nDrag And Drop File Here");
    update();
  }

  void Clear_FamilyBook() {
    selectedFamilyBook.value = null;

    updateHoverFamilyBook(false);
    updateTextFamilyBook(
        "Click To Add Family notebook\nOr\nDrag And Drop File Here");
    update();
  }

  void initialdata() {
    ClearselectedFatherPassport();
    ClearselectedMotherPassport();
    Clear_Son();
    Clear_id();
    Clear_Certificate();
    Clear_tasalsol();
    Clear_FamilyBook();
    update();
  }
}
