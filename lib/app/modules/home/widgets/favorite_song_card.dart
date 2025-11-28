import 'package:flutter/material.dart';

import '../../../core/values/values.dart';
import '../../../data/models/song_model.dart';

class FavoriteSongCard extends StatelessWidget {
  const FavoriteSongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
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
  }
}