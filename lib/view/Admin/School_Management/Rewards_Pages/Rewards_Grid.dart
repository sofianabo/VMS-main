import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';

GlobalKey RewardsGloballKey = GlobalKey(); // مفتاح لالتقاط الصورة من الـ Stack

class RewardsGrid extends StatefulWidget {
  const RewardsGrid({super.key});

  @override
  State<RewardsGrid> createState() => _RewardsGridState();
}

class _RewardsGridState extends State<RewardsGrid> {
  @override
  void initState() {
    final controller = Get.find<RewardsController>();
    if (controller.images.isNotEmpty) {
      controller.selectImage(controller.images.first); // اختيار أول صورة
    }
    controller.InitialTextOverlay(
        text: "شهادة امتياز",
        isbold: true,
        color: Color(0xff333B99),
        position: Offset(436, 32),
        size: 24);
    controller.InitialTextOverlay(
        text: "اسرة المدرس الافتراضية الحديثة تهنئ الطالب",
        isbold: false,
        color: Colors.black,
        position: Offset(363, 115),
        size: 16);
    controller.InitialTextOverlay(
        text: "ليث هيثم عزام",
        isbold: false,
        color: Colors.black,
        position: Offset(426, 222),
        size: 36);
    controller.InitialTextOverlay(
        text: "لتميزه في مادة العلوم",
        isbold: false,
        color: Colors.black,
        position: Offset(370, 369),
        size: 36);
    controller.InitialTextOverlay(
        text: "وتتمنى له دوام التقدم و النجاح الدائم",
        isbold: false,
        color: Colors.black,
        position: Offset(281, 523),
        size: 16);
    controller.InitialTextOverlay(
        text:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
        isbold: false,
        color: Colors.black,
        position: Offset(706, 573),
        size: 16);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RewardsController>(
      init: RewardsController(),
      builder: (controller) {
        return GestureDetector(
          onTap: controller.deselectText,
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 75, right: 75),
                  width: 300,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Color(0xff134B70),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: controller.images
                            .map((image) => GestureDetector(
                                  onTap: () {
                                    controller.selectImage(image);
                                  },
                                  child: SvgPicture.asset(
                                    image,
                                    width: 300,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
                RepaintBoundary(
                  key: RewardsGloballKey,
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    width: 850,
                    height: 600,
                    child: Stack(
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            controller.selectedImage,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        for (int i = 0; i < controller.textOverlays.length; i++)
                          DraggableText(
                            onDelete: () {
                              controller.deleteText(i);
                            },
                            overlay: controller.textOverlays[i],
                            onUpdate: (updatedOverlay) =>
                                controller.updateTextOverlay(i, updatedOverlay),
                            onSelect: () {
                              controller.selectText(i);
                            },
                            isSelected: controller.selectedTextIndex == i,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TextOverlay {
  String text;
  Offset position;
  double fontSize;
  Color color;
  bool isBold;
  bool isSelected;

  TextOverlay({
    required this.text,
    required this.position,
    required this.fontSize,
    required this.color,
    this.isBold = false,
    this.isSelected = false,
  });
}

class DraggableText extends StatefulWidget {
  final TextOverlay overlay;
  final Function(TextOverlay) onUpdate;
  final Function onSelect;
  final Function onDelete;
  final bool isSelected;

  const DraggableText({
    super.key,
    required this.overlay,
    required this.onUpdate,
    required this.onSelect,
    required this.onDelete,
    required this.isSelected,
  });

  @override
  _DraggableTextState createState() => _DraggableTextState();
}

class _DraggableTextState extends State<DraggableText> {
  late Offset position;
  late double fontSize;
  late Color color;
  late bool isBold;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    position = widget.overlay.position;
    fontSize = widget.overlay.fontSize;
    color = widget.overlay.color;
    isBold = widget.overlay.isBold;
    textController = TextEditingController(text: widget.overlay.text);
  }

  void _pickColor() {
    // استخدام Overlay لعرض الـ Dialog فوق العناصر الأخرى
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("اختر لون النص"),
                ColorPicker(
                  hexInputBar: true,
                  pickerColor: color,
                  labelTextStyle: TextStyle(color: Colors.black),
                  onColorChanged: (newColor) {
                    setState(() {
                      color = newColor;
                    });
                    widget.onUpdate(TextOverlay(
                      text: textController.text,
                      position: position,
                      fontSize: fontSize,
                      color: color,
                      isBold: isBold,
                      isSelected: widget.isSelected,
                    ));
                  },
                ),
                TextButton(
                  child: Text("موافق"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onTap: () => widget.onSelect(),
        onPanUpdate: (details) {
          setState(() {
            position += details.delta;
          });
          widget.onUpdate(TextOverlay(
            text: textController.text,
            position: position,
            fontSize: fontSize,
            color: color,
            isBold: isBold,
            isSelected: widget.isSelected,
          ));
        },
        child: Stack(
          children: [
            if (widget.isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Theme.of(context).cardColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: textController,
                          onChanged: (newText) {
                            widget.onUpdate(TextOverlay(
                              text: newText,
                              position: position,
                              fontSize: fontSize,
                              color: color,
                              isBold: isBold,
                              isSelected: widget.isSelected,
                            ));
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "أدخل النص",
                          ),
                        ),
                      ),
                      Slider(
                        min: 10,
                        max: 50,
                        value: fontSize,
                        onChanged: (newSize) {
                          setState(() {
                            fontSize = newSize;
                          });
                          widget.onUpdate(TextOverlay(
                            text: textController.text,
                            position: position,
                            fontSize: fontSize,
                            color: color,
                            isBold: isBold,
                            isSelected: widget.isSelected,
                          ));
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.color_lens, color: color),
                            onPressed: _pickColor,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              widget.onDelete(); // حذف النص عند الضغط
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              isBold
                                  ? Icons.format_bold
                                  : Icons.format_bold_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                isBold = !isBold;
                              });
                              widget.onUpdate(TextOverlay(
                                text: textController.text,
                                position: position,
                                fontSize: fontSize,
                                color: color,
                                isBold: isBold,
                                isSelected: widget.isSelected,
                              ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                textController.text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
