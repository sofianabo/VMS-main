import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';

class RewardsController extends GetxController {
  String selectedImage = "../../images/Certificate/c3.svg";
  List<String> images = [
    "../../images/Certificate/c2.svg",
    "../../images/Certificate/c1.svg",
    "../../images/Certificate/c3.svg",
    "../../images/Certificate/c4.svg",
    "../../images/Certificate/c5.svg"
  ];

  List<TextOverlay> textOverlays = [];
  int? selectedTextIndex;

  var progress = 0.0.obs;

  void selectImage(String image) {
    selectedImage = image;
    update();
  }

  void addTextOverlay() {
    textOverlays.add(TextOverlay(
      text: "نص جديد",
      position: Offset(100, 100),
      fontSize: 20,
      color: Colors.black,
      isBold: false,
      isSelected: false,
    ));
    update();
  }

  void InitialTextOverlay(
      {required String text,
      required Offset position,
      required int size,
      required Color color,
      required bool isbold}) {
    textOverlays.add(TextOverlay(
      text: text,
      position: position,
      fontSize: size.toDouble(),
      color: color,
      isBold: isbold,
      isSelected: false,
    ));
    update();
  }

  void updateTextOverlay(int index, TextOverlay updatedOverlay) {
    textOverlays[index] = updatedOverlay;
    update();
  }

  void selectText(int index) {
    selectedTextIndex = index;

    TextOverlay selectedOverlay = textOverlays.removeAt(index);
    textOverlays.insert(0, selectedOverlay);

    for (var overlay in textOverlays) {
      overlay.isSelected = false;
    }
    textOverlays[0].isSelected = true;
    update();
  }

  void deselectText() {
    selectedTextIndex = null;
    for (var overlay in textOverlays) {
      overlay.isSelected = false;
    }
    update();
  }

  void deleteText(int index) {
    textOverlays.removeAt(index);
    selectedTextIndex = -1;
    update();
  }
}
