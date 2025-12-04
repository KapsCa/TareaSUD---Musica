import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../core/values/values.dart';
import '../controllers/dog_controller.dart';
import 'widgets.dart';

class DogsListview extends GetView<DogController> {
  const DogsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppStyles.homePadding,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.album, style: AppStyles.title),
          ),
        ),
        Obx(() {
          final listBreedsDogs = controller.listBreedsDogs;
          if (controller.isloading.value) {
            //Primero, carga los datos.
            return const CircularProgressIndicator();
          } else if (listBreedsDogs.isEmpty) {
            return Text('No hay datos para mostrar');
          } else {
            //ya cargo y los muestra
            return ListView.builder(
              itemCount: listBreedsDogs.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return DogAnimatedItem(dog: listBreedsDogs[index]);
              },
            );
          }
        }),
      ],
    );
  }
}
