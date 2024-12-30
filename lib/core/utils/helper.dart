import 'package:get/get.dart';

void showSnackbar(String title, String message,
    {SnackPosition position = SnackPosition.TOP, SnackStyle}) {
  Get.snackbar(title, message, snackPosition: position);
}

void navigateTo(String route) {
  Get.offAllNamed(route);
}
