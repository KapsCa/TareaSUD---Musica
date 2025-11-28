import 'package:flutter/material.dart';

abstract class AppStyles {
  //? 1. Estilos de Texto
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: Colors.white70,
  );

  static const TextStyle duration = TextStyle(
    fontSize: 10,
    color: Colors.white,
  );


  static const TextStyle copyright = TextStyle(
    color: Colors.white70,
    fontSize: 12,
  );

  static const TextStyle musicBannerTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle musicBannerSubtitle = TextStyle(
    fontSize: 14,
    color: Colors.white70,
  );

  static const TextStyle tagBanner = TextStyle(
    fontSize: 5,
    color: Colors.white,
    fontStyle: FontStyle.italic,
  );
  
  static const TextStyle btnPlay = TextStyle(fontSize: 14, color: Colors.white);

  //? 2. Decoración de Inputs (¡Sí, también se puede!)
  static final InputDecoration loginInputDecoration = InputDecoration(
    prefixIcon: const Icon(Icons.phone_iphone_rounded, color: Colors.white70),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.purple),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.purpleAccent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
    ),
    filled: true,
    fillColor: Colors.white12,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 10.0,
    ),
  );

  //? 3. Botones
  static final ButtonStyle loginButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  );

  static final ButtonStyle bannerButton = TextButton.styleFrom(
    backgroundColor: Color.fromARGB(38, 255, 255, 255),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: Colors.white30),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
  );

  //? 4. Otros estilos globales
  //*Pading Home
    static EdgeInsets homePadding = const EdgeInsets.only(left: 20.0, top: 16.0, bottom: 8.0);

  //*Sombra para tarjetas
  static BoxShadow boxShadowBanner = BoxShadow(
    // ignore: deprecated_member_use
    color: const Color.fromARGB(75, 155, 39, 176), // Un poco de sombra púrpura
    blurRadius: 10,
    offset: Offset(0, 4),
  );
  //*Degradado oscuro para banners
  static BoxDecoration darkFilterGradient = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black12, Colors.black87],
    ),
  );
  //*Estilo para las imágenes en slider
  static BoxDecoration favoriteImageDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
  );

}
