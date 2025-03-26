import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future showLoadingIndicator() {
  double size = 70;
  return Get.dialog(
    Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(
            // valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            backgroundColor: Colors.white60,
            strokeWidth: 2.0,
          ),
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
  );
}

hideLoadingIndicator() {
  Get.back();
}
