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
        FutureBuilder(
          future: controller.loadBreedsDogs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return DogsListItem(dog: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
