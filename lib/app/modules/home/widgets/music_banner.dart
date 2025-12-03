import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/values/values.dart';
import '../controllers/home_controller.dart';
import 'widgets.dart';

class MusicBanner extends StatelessWidget {
  const MusicBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //*Estilo del Banner
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          //* La imagen de fondo
          image: AssetImage('assets/images/cover-1.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [AppStyles.boxShadowBanner],
      ),
      child: Stack(
        children: [
          //*Filtro Oscuro con Degradado
          Container(decoration: AppStyles.darkFilterGradient),
          //*Contenido del Banner
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 15.0,
            ),
            child: _BannerContent(),
          ),
        ],
      ),
    );
  }
}

class _BannerContent extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*Etiqueta
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(66, 0, 0, 0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            AppStrings.recentlyPlayed,
            style: AppStyles.tagBanner,
          ),
        ),

        const Spacer(),

        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.albumListObs[0].title,
                      style: AppStyles.musicBannerTitle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      controller.albumListObs[0].artist,
                      style: AppStyles.musicBannerSubtitle.copyWith(
                        color: Color.fromARGB(179, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
              PlayButton(),
            ],
          ),
        ),
      ],
    );
  }
}
