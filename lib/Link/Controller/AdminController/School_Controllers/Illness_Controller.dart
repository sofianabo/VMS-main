import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as gets;
import 'package:vms_school/Link/Model/AdminModel/School_Models/Illness_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Illness.dart'
    as stuill;

class Illness_Controller extends gets.GetxController {
  List<Illness> selectedIllnesses = [];
  List<stuill.Illnesses> previousSelectedIllnesses = [];
  List<Map<String, dynamic>> files = [];
  Map<String, dynamic> filesMap = {};
  List<Map<String, dynamic>> finalList = [];
  String? filterName = '';
  bool isSelectedOnly = true;
  List<Illness>? illness;
  List<Illness>? filteredIllness;

  bool isLoading = true;

  var chronic = false.obs;

  initialdata() {
    filterName = '';
    selectedIllnesses.clear();
    previousSelectedIllnesses.clear();
    files.clear();
    filesMap.clear();
    finalList.clear();
    illness = [];
    filteredIllness = [];
    isSelectedOnly = true;
  }

  void togglechronic(bool value) {
    chronic.value = value;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Illness> tempFilteredList = List.from(illness!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        final curEName = cur.enName?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase()) ||
            curEName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredIllness = tempFilteredList;
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

  void SetData(Illness_Model illness_Model) {
    final previousSelectedIllnesses = List<Illness>.from(selectedIllnesses);

    illness = illness_Model.illness;
    filteredIllness = List.from(illness!);

    selectedIllnesses = illness!
        .where((illness) => previousSelectedIllnesses.any(
              (selected) => selected.id == illness.id,
            ))
        .toList();

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    SetFinalList();
    SetIsLoading(false);
    update();
  }

  void setIllnessSelected(stuill.Students_Illness selectedIllness) {
    previousSelectedIllnesses =
        List<stuill.Illnesses>.from(selectedIllness.illnesses ?? []);

    try {
      if (illness != null) {
        selectedIllnesses = illness!
            .where((illness) => previousSelectedIllnesses.any(
                  (selected) => selected.illness?.id == illness.id,
                ))
            .toList();

        for (var selectedIllness in selectedIllnesses) {
          if (!files
              .any((file) => file["id"] == selectedIllness.id.toString())) {
            files.add({
              "id": selectedIllness.id.toString(),
              "fileid": null,
              "file": null,
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

  void toggleSelection(Illness illness) {
    if (selectedIllnesses.contains(illness)) {
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
                content: SizedBox(
                  width: 400,
                  height: 300,
                  child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(
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
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFF2E98A8)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(300 / 3, 50))),
                        child: const Text('Yes',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          removeFile(illness);
                          selectedIllnesses
                              .removeWhere((entry) => entry.id == illness.id);

                          previousSelectedIllnesses
                              .removeWhere((e) => e.illness?.id == illness.id);
                          gets.Get.back();
                        },
                      ),
                      TextButton(
                        style: ButtonStyle(
                            shadowColor: const MaterialStatePropertyAll(
                                Color(0xffffffff)),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFF2E98A8)),
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
            .removeWhere((e) => e.illness?.id == illness.id);
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

  bool isSelected(Illness illness) {
    return selectedIllnesses.contains(illness);
  }

  void attachFile(Illness illness) async {
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

  void removeFile(Illness illness) {
    files.removeWhere((file) => file["id"] == illness.id.toString());
    SetFinalList();
    update();
  }

  void clearFile(Illness illness) {
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
              content: SizedBox(
                width: 400,
                height: 300,
                child: Expanded(
                  child: Column(
                    children: [
                      SizedBox(
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
                          if (illnessEntry.illness?.id.toString() ==
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

  bool hasFile(Illness illness) {
    return files.any((entry) =>
        entry["id"] == illness.id.toString() && entry.containsKey("file"));
  }

  String? getFileName(Illness illness) {
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
          .firstWhere((entry) => entry.illness?.id == illness.id,
              orElse: () => stuill.Illnesses())
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

  void SetisSelectedOnly(bool value) {
    isSelectedOnly = value;
    update();
  }
}
