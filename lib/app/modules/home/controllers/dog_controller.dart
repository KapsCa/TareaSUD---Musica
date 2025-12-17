import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/dog_model.dart';
import '../../../data/repositories/dog_repository.dart';

class DogController extends GetxController {
  DogController(this.dogRepository);
  final DogRepository dogRepository;
  final isloading= false.obs;
  RxList<BreedsDogs> listBreedsDogs = <BreedsDogs>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBreedsDogs();
  }

  Future loadBreedsDogs() async{
    isloading.value = true;
    try {
      final results = await dogRepository.getBreedsDogs();
      listBreedsDogs.assignAll(results);
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      Get.snackbar('Error', 'Ocurrio un problema: $e',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(64, 255, 82, 82),
          colorText: Colors.white);
    }
  }

}
