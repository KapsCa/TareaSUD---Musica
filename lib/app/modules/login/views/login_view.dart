import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../controllers/login_controller.dart';
import '../widgets/widgets.dart';

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
                        LoginCard(),
                      ],
                    ),
                  ),
                ),
                //*Texto de copyright abajo - FIJO DEBE IR AL FINAL
                Text(AppStrings.copyright, style: AppStyles.copyright),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


