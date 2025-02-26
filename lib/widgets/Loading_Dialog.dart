import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';



Loading_Dialog({ required CancelToken cancelToken}){
  return Get.dialog(
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: WillPopScope(
        onWillPop: () async {
          cancelToken.cancel();
          return false;
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          surfaceTintColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(top: 0, left: 35.0, right: 35.0, bottom: 20.0),
          actionsPadding: const EdgeInsets.all(15.0),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Get.theme.primaryColor,
                  size: 60,
                ),
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(""),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  onPressed: () {
                    cancelToken.cancel();
                    Get.back();
                  },
                  icon: const Icon(Icons.close_rounded, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
