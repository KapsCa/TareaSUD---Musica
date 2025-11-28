import 'package:flutter/material.dart';

import '../../../core/values/values.dart';

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
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.purple.withOpacity(0.3), // Un poco de sombra púrpura
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          //*Filtro Oscuro con Degradado (para que el texto se lea mejor)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black87],
              ),
            ),
          ),
          //Contenido: Texto y Botón
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
        Chip(
          label: const Text(
            'Escuchado recientemente',
            style: AppStyles.chipBanner,
          ),
          // ignore: deprecated_member_use
          // backgroundColor: Colors.black45,
          backgroundColor: Colors.black.withOpacity(0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sweet Melody', style: AppStyles.musicBannerTitle),
                  Text(
                    'Little Mix - 2023, Álbum 32',
                    style: AppStyles.musicBannerSubtitle,
                  ),
                ],
              ),
            ),
            BannerButton(),
          ],
        ),
      ],
    );
  }
}

class BannerButton extends StatelessWidget {
  const BannerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return TextButton(
      onPressed: () {},
      style: AppStyles.bannerButton,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.play_arrow_rounded, size: 20),
          SizedBox(width: 5),
          Text('Reproducir', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
