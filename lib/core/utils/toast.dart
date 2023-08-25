import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ToastUtil {
  ToastUtil._();

  static Duration duration = const Duration(seconds: 50);
  static Duration animationDuration = const Duration(milliseconds: 500);

  static void showSuccessToast({
    required String message,
    Widget? icon,
    Duration? duration,
  }) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      duration: duration ?? 5.seconds,
      borderRadius: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
      ),
      icon: icon ?? Icon(Iconsax.tick_square, size: 25, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundGradient: LinearGradient(
        colors: [
          Colors.blueAccent.withOpacity(.6),
          Colors.lightBlueAccent,
        ],
      ),
    );
  }

  static void showInformationToast({
    required String message,
    Widget? icon,
    Duration? duration,
  }) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      duration: duration ?? 5.seconds,
      borderRadius: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
      ),
      icon: icon ?? Icon(Iconsax.danger, size: 25, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundGradient: LinearGradient(
        colors: [
          Colors.blueAccent.withOpacity(.6),
          Colors.lightBlueAccent,
        ],
      ),
    );
  }

  static void showErrorToast({
    String message = 'Unknown error',
    Widget? icon,
    Duration? duration,
  }) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      duration: duration ?? 5.seconds,
      borderRadius: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
      ),
      icon: icon ?? Icon(Iconsax.danger, size: 25, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundGradient: LinearGradient(
        colors: [
          Colors.blueAccent.withOpacity(.6),
          Colors.lightBlueAccent,
        ],
      ),
    );
  }

  static void showCustomToast() {}
}

class Iconsa {}
