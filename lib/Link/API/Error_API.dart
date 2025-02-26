import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static void handleDioError(DioException error) {
    String message;

    if (error.type == DioExceptionType.badResponse) {
      int statusCode = error.response?.statusCode ?? 0;

      switch (statusCode) {
        case 232:
          message = "عذرا لقد تم رفع الحضور لهذا اليوم سابقاً.";
          break;
        case 400:
          message = "طلب غير صحيح. يرجى المحاولة مرة أخرى.";
          break;
        case 401:
          message = "غير مصرح لك بالوصول. يرجى تسجيل الدخول.";
          break;
        case 402:
          message = "محجوزة للطلبات المدفوعة.";
          break;
        case 403:
          message = "تم رفض الوصول. ليس لديك الصلاحيات اللازمة.";
          break;
        case 404:
          message = "المورد المطلوب غير موجود.";
          break;
        case 412:
          message = "الشروط المحددة للطلب غير محققة.";
          break;
        case 416:
          message = "نطاق البيانات المطلوب غير متاح.";
          break;
        case 418:
          message = "حدث خطأ في ارسال البيانات.";
          break;
        case 422:
          message = "لا يمكن معالجة البيانات المرسلة.";
          break;
        case 430:
          message = "المدرس لديه حصة اخرى في هذا الوقت.";
          break;
        case 431:
          message = "عذرا هذه الخانة تحتوي على حصة سابقة.";
          break;
        case 500:
          message = "حدث خطأ داخلي في الخادم. يرجى المحاولة لاحقًا.";
          break;
        case 503:
          message = "الخدمة غير متوفرة حاليًا. حاول لاحقًا.";
          break;
        default:
          message =
              "حدث خطأ غير متوقع برمز: $statusCode. يرجى المحاولة لاحقًا.";
      }
    } else if (error.type == DioExceptionType.connectionTimeout) {
      message = "انتهى وقت الاتصال بالخادم. يرجى التحقق من اتصالك.";
    } else if (error.type == DioExceptionType.sendTimeout) {
      message = "انتهى وقت إرسال الطلب. حاول مرة أخرى.";
    } else if (error.type == DioExceptionType.receiveTimeout) {
      message = "انتهى وقت استلام الرد من الخادم. حاول مرة أخرى.";
    } else if (error.type == DioExceptionType.cancel) {
      message = "تم إلغاء الطلب. حاول مرة أخرى.";
    } else {
      message = "حدث خطأ أثناء معالجة الطلب. يرجى المحاولة لاحقًا.";
    }

    Get.snackbar(
      "خطأ",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  static void handleException(Exception e) {
    String message = "حدث خطأ أثناء معالجة الطلب. يرجى المحاولة لاحقًا.";

    if (Get.isSnackbarOpen) {
    } else {
      Get.snackbar(
        "خطأ",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
