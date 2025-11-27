import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/values.dart';
import '../controllers/login_controller.dart';

class LoginCard extends GetView<LoginController> {
  const LoginCard({super.key});

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
              controller.submit(),
            },
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration: AppStyles.loginInputDecoration.copyWith(
            hintText: AppStrings.phoneHint,
          ),
          onChanged: (value) => controller.onPhoneNumberChanged(value),
          validator: (value) => controller.validatePhone(value),
        ),
      ),
    );
  }
}
