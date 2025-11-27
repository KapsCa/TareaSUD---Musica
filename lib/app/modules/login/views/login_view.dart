import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

// Al poner <LoginController>, le dices a la vista exactamente qué cerebro usar
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  static const _backgroundImagePath = 'assets/images/login_background.png';
  static const _logoImagePath = 'assets/images/icono.png';
  static const _titleText = 'Ingresa tu numero de teléfono';
  static const _subtitleText =
      'Por favor, ingresa tu número de teléfono para continuar';
  static const _phonePlaceholder = '9931234567';

  @override
  Widget build(BuildContext context) {
    // Definimos si el teclado está abierto
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Imagen de fondo con filtro de color - FIJA
          Image.asset(_backgroundImagePath, fit: BoxFit.cover),
          //Contenido de la pantalla
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      children: [
                        //Espacio en blanco arriba
                        AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 300,
                          ), // Cuánto tarda la animación
                          height: isKeyboardOpen
                              ? 0
                              : 80, // <--- AQUÍ ESTÁ TU TRUCO MAESTRO
                          child: const SizedBox(), // Contenido vacío
                        ),
                        //Card con elementos de login
                        _LoginCard(),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Creada por KevinCa © Nov/2025',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginCard extends StatelessWidget {
  const _LoginCard();

  static final _inputDecoration = InputDecoration(
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
    fillColor: Colors.white.withOpacity(0.1),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 15.0,
      horizontal: 10.0,
    ),
    hintText: LoginView._phonePlaceholder,
  );

  static const _titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const _subtitleStyle = TextStyle(fontSize: 14, color: Colors.white70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black26,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: Column(
        children: [
          //Logo de la app
          const CircleAvatar(
            backgroundImage: AssetImage(LoginView._logoImagePath),
            radius: 50,
          ),
          const SizedBox(height: 16),
          //Titulo y subtitulo
          Text(
            LoginView._titleText,
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            LoginView._subtitleText,
            style: _subtitleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          //Formulario de login
          _LoginForm(inputDecoration: _inputDecoration),
          const SizedBox(height: 16),
          //Botón de ingresar
          TextButton(
            onPressed: () => {
              //TODO: GO HOME despues de validar
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text('Ingresar'),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({required InputDecoration inputDecoration})
    : _inputDecoration = inputDecoration;

  final InputDecoration _inputDecoration;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration: _inputDecoration,
          validator: (value) {
            String pattern =
                r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$';
            RegExp regExp = RegExp(pattern);
            return (value != null && regExp.hasMatch(value))
                ? null
                : 'Número de teléfono inválido';
          },
        ),
      ),
    );
  }
}
