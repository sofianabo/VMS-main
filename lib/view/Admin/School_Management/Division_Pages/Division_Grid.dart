import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Delete_Division_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Edit_Division_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class DivisionGrid extends StatelessWidget {
  DivisionGrid({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController meetUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Divisions_Controller>(builder: (control) {
      return control.Isapiloading == true ?
      GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.1),
        itemCount: 10,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Theme.of(context).cardColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SchemaWidget(width: 35, height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SchemaWidget(width: 30, height: 15),
                      ],
                    ),
                    SchemaWidget(width: 30, height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SchemaWidget(width: 30, height: 15),
                        SchemaWidget(width: 25, height: 25),
                      ],
                    )
                  ],
                )),
          ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              angle: 1,
              color: Colors.grey.withOpacity(0.2),
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 1));
        },
      )
          :
      control.filteredDivision!.isNotEmpty?
      GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.1),
        itemCount: control.filteredDivision!.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {

                arName.text = "${control.filteredDivision![index].name}";
                enName.text = "${control.filteredDivision![index].enName}";
                meetUrl.text = "${control.filteredDivision![index].meetUrl}";
                Get.dialog(VMSAlertDialog(
                  action: [
                    ButtonDialog(
                      text: "Edit",
                      onPressed: () {
                        Edit_Division_API(context).Edit_Division(
                          name: arName.text ,
                          enName: enName.text,
                          gradeId: control.filteredDivision![index].id,
                          meeturl: meetUrl.text,
                        );
                      },
                      color: Theme.of(context).primaryColor,
                      width: 120,
                    ),
                  ],
                  contents: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Textfildwithupper(
                            width: 250,
                            controller: enName,
                            Uptext: "Grade En - Name",
                            hinttext: "Grade En - Name",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 15.0),
                            child: Textfildwithupper(
                              width: 250,
                              controller: arName,
                              Uptext: "Grade Ar - Name",
                              hinttext: "Grade Ar - Name",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Textfildwithupper(
                            readOnly: true,
                            width: 250,
                            controller: TextEditingController(text: control.filteredDivision![index].classes!.enName),
                            Uptext: "Class",
                            hinttext: "Class",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Textfildwithupper(
                                  width: 230,
                                  controller: meetUrl,
                                  Uptext: "Meet URL",
                                  hinttext: "Meet URL",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, top: 36.0),
                                  child: SvgPicture.asset(
                                    "../../images/meet.svg",
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  apptitle: "Edit Division",
                  subtitle: "none",
                ));
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Theme.of(context).cardColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      control.filteredDivision![index].hasStudent == true ?
                          const Text("")
                          : Container(
                        width: 35,
                        height: 35,
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
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xffB03D3D)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Delete",
                                        onPressed: () async {
                                         await Delete_Division_API(context).Delete_Division(index: index , Id: control.filteredDivision![index].id);
                                        },
                                        color: const Color(0xffB03D3D),
                                        width: 80),
                                    ButtonDialog(
                                        text: "Cancel",
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 80)
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 400,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Do You Want To Delete (${control.filteredDivision![index].enName}) Division",
                                            style: Theme.of(context).textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  apptitle: "Delete Division",
                                  subtitle: "none"));
                            },
                            icon: const Icon(VMS_Icons.bin,
                                size: 16, color: Colors.white)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${control.filteredDivision![index].enName}",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: 20,
                              )),
                        ],
                      ),
                      Text("${control.filteredDivision![index].classes!.enName}",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontSize: 14, )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Meet URL",
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: 16,
                              )),
                          SvgPicture.asset(
                            "../../images/meet.svg",
                            width: 20,
                          )
                        ],
                      )
                    ],
                  )),
            ),
          );
        },
      ) : Center(child: Text("No Divisions" , style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.normal
      )));
    });
  }
}
