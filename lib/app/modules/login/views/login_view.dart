import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../controllers/login_controller.dart';

// Al poner <LoginController>, le dices a la vista exactamente qué cerebro usar
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos si el teclado está abierto
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          //*Imagen de fondo con filtro de color - FIJA DEBE IR PRIMERO
          Image.asset(AppAssets.loginBackground, fit: BoxFit.cover),
          //*Contenido de la pantalla
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
                        //*Espacio en blanco arriba
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isKeyboardOpen
                              ? 0
                              : 80, //* <--- Cuando se abre el teclado, se oculta
                          child: const SizedBox(), // Contenido vacío
                        ),
                        //*Card con elementos de login
                        _LoginCard(),
                      ],
                    ),
                  ),
                ),
                Text(AppStrings.copyright, style: AppStyles.copyright),
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

  static const _titleStyle = AppStyles.title;

  static const _subtitleStyle = AppStyles.subtitle;

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
          //*Logo de la app
          const CircleAvatar(
            backgroundImage: AssetImage(AppAssets.logo),
            radius: 50,
          ),
          const SizedBox(height: 16),

          //*Titulo y subtitulo
          Text(
            AppStrings.loginTitle,
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          Text(
            AppStrings.loginSubtitle,
            style: _subtitleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          //*Formulario de login
          _LoginForm(),
          const SizedBox(height: 16),

          //Botón de ingresar
          TextButton(
            onPressed: () => {
              //TODO: validar
              Get.toNamed('/HOME'),
            },
            style: AppStyles.loginButtonStyle,
            child: Text(AppStrings.btnEnter),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration: AppStyles.loginInputDecoration.copyWith(
            hintText: AppStrings.phoneHint,
          ),
          validator: (value) {
            //* Expresión regular simple para validar números de teléfono
            RegExp regExp = RegExp(AppStrings.phoneValidationPattern);
            return (value != null && regExp.hasMatch(value))
                ? null
                : AppStrings.invalidPhoneError;
          },
        ),
      ),
    );
  }
}
