import 'package:flutter/material.dart';

import '../../../core/values/values.dart';
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

class _BannerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //*Etiqueta
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Escuchado recientemente',
            style: AppStyles.tagBanner,
          ),
        ),

        const Spacer(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!Estatico, aqui se deberia importar las canciones
                  Text('Sweet Melody', style: AppStyles.musicBannerTitle),
                  Text(
                    'Little Mix - 2023, Álbum 32',
                    style: AppStyles.musicBannerSubtitle,
                  ),
                ],
              ),
            ),
            PlayButton(),
          ],
        ),
      ],
    );
  }
}
