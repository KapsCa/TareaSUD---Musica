import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final phoneNumber = ''.obs;

  void onPhoneNumberChanged(String value) {
    phoneNumber.value = value;
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
    if (validatePhone(phoneNumber.value) == null) {
      Get.toNamed(AppPages.HOME);
    } else {
      Get.snackbar('Error', AppStrings.invalidPhoneError);
    }
  }
}
