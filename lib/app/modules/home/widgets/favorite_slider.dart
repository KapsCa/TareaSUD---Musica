import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../controllers/home_controller.dart';

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
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(left: 20.0),
                  decoration: AppStyles.favoriteImageDecoration,
                  //*Imagen de las canciones favoritas
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.asset(
                          song.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        //*Banner de play
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            color: Colors.black38,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        song.title,
                                        maxLines: 1,
                                        style: AppStyles.btnPlay,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        song.duration,
                                        style: AppStyles.duration
                                      ),
                                    ],
                                  ),
                                ),
                                //*icono de play
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
