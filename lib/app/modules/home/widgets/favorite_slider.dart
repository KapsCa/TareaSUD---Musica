import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../controllers/home_controller.dart';
import 'widgets.dart';

class FavoriteSlider extends GetView<HomeController> {
  const FavoriteSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppStyles.homePadding,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.favorites, style: AppStyles.title),
          ),
        ),
        //*Slider horizontal de canciones favoritas
        Obx(
          () => SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.favoriteSongsObs.length,
              itemBuilder: (context, index) {
                final song = controller.favoriteSongsObs[index];
                return FavoriteSongCard(song: song);
              },
            ),
          ),
        ),
      ],
    );
  }
}
