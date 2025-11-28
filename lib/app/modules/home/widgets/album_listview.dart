import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/values.dart';
import '../controllers/home_controller.dart';

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
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage(album.imagePath),
                      radius: 35,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(album.title, style: AppStyles.title),
                          Text(album.artist, style: AppStyles.subtitle),
                          Text(album.duration, style: AppStyles.duration),
                        ],
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.more_vert, color: Colors.white70),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
