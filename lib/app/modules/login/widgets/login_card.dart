import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../controllers/login_controller.dart';

class LoginCard extends GetView<LoginController> {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(66, 0, 0, 0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(97, 0, 0, 0),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            style: AppStyles.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          Text(
            AppStrings.loginSubtitle,
            style: AppStyles.subtitle.copyWith(color: Color.fromARGB(179, 255, 255, 255),),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          //*Formulario de login
          _LoginForm(),
          const SizedBox(height: 16),

          //Botón de ingresar
          TextButton(
            onPressed: () => {controller.submit()},
            style: AppStyles.loginButtonStyle,
            child: Text(AppStrings.btnEnter),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller.phoneController,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => controller.submit(),
          decoration: AppStyles.loginInputDecoration.copyWith(
            hintText: AppStrings.phoneHint,
          ),
          validator: controller.validatePhone,
        ),
      ),
    );
  }
}
