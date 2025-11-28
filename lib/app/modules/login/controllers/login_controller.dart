import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

@override
  void onClose() {
    // Buena práctica: Liberar memoria cuando el controlador se destruye
    phoneController.dispose();
    super.onClose();
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings
          .invalidPhoneError; // O un mensaje como "Campo requerido"
    }

    RegExp regExp = RegExp(AppStrings.phoneValidationPattern);
    if (regExp.hasMatch(value)) {
      return null;
    }

    return AppStrings.invalidPhoneError;
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      
      Get.offNamed(AppPages.HOME);
    } else {
      Get.snackbar(
        'Atención',
        'Por favor verifica el número de teléfono',
      );
    }
  }
}
