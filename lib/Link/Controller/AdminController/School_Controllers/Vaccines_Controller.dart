import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Vaccines_Model.dart'
    as stuill;

class Vaccines_Controller extends gets.GetxController {
  String? filterName = '';
  List<Vaccine> selectedIllnesses = [];

  List<stuill.Vaccineses> previousSelectedIllnesses = [];

  Map<String, dynamic> filesMap = {};
  List<Map<String, dynamic>> files = [];

  List<Map<String, dynamic>> finalList = [];

  List<Vaccine>? vaccine;
  List<Vaccine>? filteredvaccine;

  bool isLoading = true;
  bool isLoadingLocation = true;

  List<String> Locationlist = [];
  String LocationIndex = "";

  SetIsLoadingLocation(bool value) {
    isLoadingLocation = value;
    update();
  }

  SetLocationlist(List<String> data) {
    Locationlist = data;
    SetIsLoadingLocation(false);
    update();
  }

  var chronic = false.obs;

  void togglechronic(bool value) {
    chronic.value = value;
  }

  initialdata() {
    selectedIllnesses.clear();
    previousSelectedIllnesses.clear();
    files.clear();
    filesMap.clear();
    finalList.clear();
    isSelectedOnly = true;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Vaccine> tempFilteredList = List.from(vaccine!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredvaccine = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchByName("");
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void SetData(Vaccines_Model illness_Model) {
    final previousSelectedIllnesses = List<Vaccine>.from(selectedIllnesses);

    vaccine = illness_Model.vaccine;
    filteredvaccine = List.from(vaccine!);

    selectedIllnesses = vaccine!
        .where((illness) => previousSelectedIllnesses.any(
              (selected) => selected.id == illness.id,
            ))
        .toList();

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    SetFinalList();
    update();
  }

  void setIllnessSelected(stuill.Students_Vaccines_Model selectedIllness) {
    previousSelectedIllnesses =
        List<stuill.Vaccineses>.from(selectedIllness.vaccineses ?? []);

    try {
      if (vaccine != null) {
        selectedIllnesses = vaccine!
            .where((illness) => previousSelectedIllnesses.any(
                  (selected) => selected.vaccines?.id == illness.id,
                ))
            .toList();

        for (var selectedIllness in selectedIllnesses) {
          if (!files
              .any((file) => file["id"] == selectedIllness.id.toString())) {
            files.add({
              "id": selectedIllness.id.toString(),
              "fileid": null, // إذا لم يكن هناك fileid
              "file": null, // إذا لم يكن هناك ملف
            });
          }
        }

        update();
      } else {
        print("Illness list is null.");
      }
    } catch (e) {
      print("Error updating student illnesses: $e");
    }
    SetFinalList();
  }

  void toggleSelection(Vaccine illness) {
    SetFinalList();
    final hasOldFile = finalList.any((entry) =>
        entry['id'] == illness.id &&
        entry.containsKey('hasOldFile') &&
        entry['hasOldFile'] == true);
    final hasNewFile = finalList.any((entry) =>
        entry['id'] == illness.id &&
        entry.containsKey('hasNewFile') &&
        entry['hasNewFile'] == true);

    if (selectedIllnesses.contains(illness)) {
      if (hasOldFile || hasNewFile) {
        gets.Get.dialog(Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 40),
            child: WillPopScope(
              onWillPop: () => Future.value(false),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                surfaceTintColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                alignment: Alignment.center,
                content: Container(
                  width: 400,
                  height: 300,
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          height: 200,
                          child: SvgPicture.asset(
                            "../../images/warning.svg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Expanded(
                            child: Center(
                                child: Text(
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: gets.Get.theme.primaryColor),
                                    textAlign: TextAlign.center,
                                    "If You Deselected The Illness The File Will Remove"))),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            shadowColor: const MaterialStatePropertyAll(
                                Color(0xffffffff)),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff972F2F)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(300 / 3, 50))),
                        child: const Text('Yes',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          removeFile(illness); // إزالة الملف إذا كان موجودًا
                          selectedIllnesses.removeWhere((entry) =>
                              entry.id ==
                              illness.id); // إزالة العنصر من القائمة

                          // إزالة fileId من previousSelectedIllnesses
                          previousSelectedIllnesses
                              .removeWhere((e) => e.vaccines?.id == illness.id);
                          gets.Get.back();
                        },
                      ),
                      TextButton(
                        style: ButtonStyle(
                            shadowColor: const MaterialStatePropertyAll(
                                Color(0xffffffff)),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff134B70)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(300 / 3, 50))),
                        child: const Text('Back',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          gets.Get.back();
                        },
                      )
                    ],
                  )
                ],
              ),
            )));
      } else {
        selectedIllnesses.removeWhere((entry) => entry.id == illness.id);

        previousSelectedIllnesses
            .removeWhere((e) => e.vaccines?.id == illness.id);
      }
    } else {
      selectedIllnesses.add(illness);

      if (!files.any((entry) => entry["id"] == illness.id.toString())) {
        files.add({"id": illness.id.toString()});
      }
    }
    SetFinalList();
    update();
  }

  bool isSelected(Vaccine illness) {
    return selectedIllnesses.contains(illness);
  }

  void attachFile(Vaccine illness) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result!.files.isNotEmpty) {
        PlatformFile file = result.files.first;

        var existingEntry = files.firstWhere(
          (entry) => entry["id"] == illness.id.toString(),
          orElse: () => {},
        );

        if (existingEntry.isNotEmpty) {
          existingEntry["file"] = MultipartFile.fromBytes(
            file.bytes!,
            filename: file.name,
          );
        } else {
          files.add({
            "id": illness.id.toString(),
            "file": MultipartFile.fromBytes(
              file.bytes!,
              filename: file.name,
            ),
          });
        }
      } else {
        if (!files.any((entry) => entry["id"] == illness.id.toString())) {
          files.add({"id": illness.id.toString(), "file": null});
        }
      }

      if (!isSelected(illness)) {
        toggleSelection(illness);
      }
      SetFinalList();
      update();
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void removeFile(Vaccine illness) {
    files.removeWhere((file) => file["id"] == illness.id.toString());
    SetFinalList();
    update();
  }

  void clearFile(Vaccine illness) {
    SetFinalList();
    final hasOldFile = finalList.any((entry) =>
        entry['id'] == illness.id &&
        entry.containsKey('hasOldFile') &&
        entry['hasOldFile'] == true);
    final hasNewFile = finalList.any((entry) =>
        entry['id'] == illness.id &&
        entry.containsKey('hasNewFile') &&
        entry['hasNewFile'] == true);

    if (hasOldFile || hasNewFile) {
      gets.Get.dialog(Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
          child: WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              surfaceTintColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.center,
              content: Container(
                width: 400,
                height: 300,
                child: Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        height: 200,
                        child: SvgPicture.asset(
                          "../../images/warning.svg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: gets.Get.theme.primaryColor),
                                  textAlign: TextAlign.center,
                                  "If You Click Yes The File Will Remove"))),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          shadowColor:
                              const MaterialStatePropertyAll(Color(0xffffffff)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff972F2F)),
                          minimumSize:
                              MaterialStatePropertyAll(Size(300 / 3, 50))),
                      child: const Text('Yes',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        var existingFile = files.firstWhere(
                          (file) => file["id"] == illness.id.toString(),
                          orElse: () => {},
                        );

                        if (existingFile.isNotEmpty) {
                          existingFile["file"] = null;
                        }

                        for (var illnessEntry in previousSelectedIllnesses) {
                          if (illnessEntry.vaccines?.id.toString() ==
                              illness.id.toString()) {
                            illnessEntry.fileId != null
                                ? illnessEntry.fileId = 0
                                : illnessEntry.fileId = null;
                          }
                        }
                        SetFinalList();
                        gets.Get.back();
                      },
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shadowColor:
                              const MaterialStatePropertyAll(Color(0xffffffff)),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff134B70)),
                          minimumSize:
                              MaterialStatePropertyAll(Size(300 / 3, 50))),
                      child: const Text('Back',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        gets.Get.back();
                      },
                    )
                  ],
                )
              ],
            ),
          )));
    }
    SetFinalList();
    update();
  }

  bool hasFile(Vaccine illness) {
    return files.any((entry) =>
        entry["id"] == illness.id.toString() && entry.containsKey("file"));
  }

  String? getFileName(Vaccine illness) {
    Map<String, dynamic>? entry = files.firstWhere(
      (entry) => entry["id"] == illness.id.toString(),
      orElse: () => {},
    );
    String? filename = entry["file"]?.filename?.toString();

    if (filename != null) {
      if (filename.length > 12) {
        return "${filename.substring(0, 8)}..${filename.substring(filename.length - 4)}";
      }
      return filename;
    }
    return "Vaccine File";
  }

  void SetFinalList() {
    finalList.clear();

    for (var illness in selectedIllnesses) {
      var fileEntry = files.firstWhere(
        (entry) => entry["id"] == illness.id.toString(),
        orElse: () => {"file": null},
      );

      var fileId = previousSelectedIllnesses
          .firstWhere((entry) => entry.vaccines?.id == illness.id,
              orElse: () => stuill.Vaccineses())
          .fileId;
      finalList.add({
        "id": illness.id,
        "file": fileEntry["file"],
        "fileid": fileId,
        "illnesName": illness.enName,
        "hasOldFile": fileId == 0 || fileId == null ? false : true,
        "hasNewFile": fileEntry["file"] != null ? true : false,
      });
    }
    print(finalList);
    update();
  }

  bool isSelectedOnly = true;
  void SetisSelectedOnly(bool value) {
    isSelectedOnly = value;
    update();
  }
}
