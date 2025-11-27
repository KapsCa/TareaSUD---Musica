import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

// Al poner <LoginController>, le dices a la vista exactamente qué cerebro usar
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      prefixIcon: Icon(Icons.phone),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.purple),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.purpleAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      // Agregando un sombreado sutil
      // No hay una propiedad directa para 'sombreado' en InputDecoration,
      // pero se puede simular con un color de fondo y un borde bien definido.
      // Para una elevación y sombra más pronunciada, se usaría un Container o Card envolvente.
      hintText: '9931234567',
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Imagen de fondo con filtro de color - FIJA
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
            child: Image.asset(
              'assets/images/login_background.png',
              fit: BoxFit.cover,
            ),
          ),
          //Contenido de la pantalla
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Espacio en blanco arriba
                  SizedBox(height: 80),
                  //Logo de la app
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/icono.png'),
                    radius: 50,
                  ),
                  //Texto principal
                  Text(
                    'Ingresa tu numero de teléfono',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Por favor, ingresa tu número de teléfono para continuar',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  //Campo de entrada de teléfono
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: inputDecoration,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
