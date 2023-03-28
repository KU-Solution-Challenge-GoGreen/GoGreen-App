import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

void errorToast(String message) {
  Get.snackbar('Error', message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.Red,
      colorText: AppColors.White,
      margin: const EdgeInsets.all(0));
  return;
}
