import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/values.dart';
import '../controllers/home_controller.dart';
import 'widgets.dart';

class AlbumListView extends GetView<HomeController> {
  const AlbumListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppStyles.homePadding,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.album, style: AppStyles.title),
          ),
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.albumListObs.length,
            itemBuilder: (context, index) {
              final album = controller.albumListObs[index];
              return AlbumListItem(album: album);
            },
          ),
        ),
      ],
    );
  }
}
