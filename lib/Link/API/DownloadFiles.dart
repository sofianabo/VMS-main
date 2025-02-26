import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

Future<void> downloadFile(String url, String fileName) async {
  Dio dio = Dio();
  try {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
      cancelToken: cancelToken,
    );
    if (response.statusCode == 200) {
      final blob = html.Blob([response.data]);
      final blobUrl = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: blobUrl)
        ..target = '_blank'
        ..download = fileName;
      anchor.click();

      html.Url.revokeObjectUrl(blobUrl);
    } else {
      print('Failed to download file. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error downloading file: $e');
  } finally {
    Get.back();
  }
}
