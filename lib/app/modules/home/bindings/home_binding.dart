import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../data/providers/dog_provider.dart';
import '../../../data/repositories/dog_repository.dart';
import '../controllers/dog_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DogController>(() => DogController(Get.find<DogRepository>()));
    Get.lazyPut<DogRepository>(() => DogRepository(Get.find<DogProvider>()));
    Get.lazyPut<DogProvider>(() => DogProvider(Client()));
  }
}
