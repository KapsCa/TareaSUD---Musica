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
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, bottom: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.favorites, style: AppStyles.title),
          ),
        ),
        Obx(
          () =>  SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.favoriteSongsObs.length,
              itemBuilder: (context, index) {
                final song = controller.favoriteSongsObs[index];
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    left: 20.0,
                  ), // Sólo margen izquierdo
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
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            color: const Color.fromARGB(77, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //!Estatico por ahora
                                      Text(
                                        song.title,
                                        maxLines: 1,
                                        style: AppStyles.btnPlay,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        song.duration,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
