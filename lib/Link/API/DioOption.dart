import 'package:dio/dio.dart';
import 'package:vms_school/main.dart';

Options getDioOptions() {
  return Options(
    headers: {
      "ngrok-skip-browser-warning": "true",
      'User-Agent': 'Custom User-Agent',
      'accept': 'application/json',
      'authorization': 'Bearer ${prefs!.getString("token")}',
    },
  );
}
