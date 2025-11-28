import 'package:flutter/material.dart';

import '../../../core/values/values.dart';
import 'widgets.dart';

class FavoriteSlider extends StatelessWidget {
  const FavoriteSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(AppStrings.favorites, style: AppStyles.title),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4, // Número de elementos en el slider
            itemBuilder: (context, index) {
              return Container(
                decoration: AppStyles.favoriteImageDecoration,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),

                //*Imagen de las canciones favoritas
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/cover-${index + 2}.jpg',
                      fit: BoxFit.cover,
                    ),
                    //*Banner de play
                    Container(
                      width: 130,
                      height: 40,
                      margin: const EdgeInsets.all(10),
                    ),
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
