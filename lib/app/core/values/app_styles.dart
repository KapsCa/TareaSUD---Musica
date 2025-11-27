import 'package:flutter/material.dart';

abstract class AppStyles {
  //? 1. Estilos de Texto
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14, color: Colors.white70
  );

  static const TextStyle copyright = TextStyle(
    color: Colors.white70,
    fontSize: 12,
  );

  //? 2. Decoración de Inputs (¡Sí, también se puede!)
  static final InputDecoration loginInputDecoration = InputDecoration(
    // ... copia aquí todo lo que tienes en _inputDecoration
    prefixIcon: const Icon(Icons.phone),
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

  static final ButtonStyle loginButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  );
}