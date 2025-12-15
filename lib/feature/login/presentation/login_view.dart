import 'package:flutter/material.dart';
import 'package:scube/config/responsive_scale.dart';
import 'package:scube/core/const/color_utils.dart';
import 'package:scube/feature/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:scube/global/k_field.dart';
import 'package:scube/route/app_pages.dart';
import 'package:scube/utils/validators.dart';



class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: body(),
            )
        ),
      ],
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _form()),
        //tosAndPp(),
      ],
    );
  }

  Widget appBar() {
    return const Text(
      'Login',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF353350),
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Obx((){
            return KField(
              headLine: 'Email Address',
              hintText: 'Your email address',
              controller: loginController.emailController,
              errorText: loginController.emailError.value,
              onChanged: (_) => loginController.emailError.value = Validators.validateEmail(loginController.emailController.text) ?? '',
              onTap: null,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            );
          }),
          SizedBox(height: ResponsiveScale.of(context).hp(1)),
          Obx((){
            return KField(
              headLine: 'Password',
              hintText: 'Enter your password',
              controller: loginController.passwordController,
              errorText: loginController.passwordError.value,
              onChanged: (_) => loginController.passwordError.value = Validators.validatePassword(loginController.passwordController.text) ?? '',
              onTap: null,
              icon: Icons.lock_outline,
              keyboardType: TextInputType.emailAddress,
              showPassIcon: true,
            );
          }),
          SizedBox(height: ResponsiveScale.of(context).hp(2)),
          // BaseButton(onClick: (){
          //   if (loginController.emailController.text.isEmpty) {
          //     loginController.emailError.value = 'Please enter email';
          //     return;
          //   }
          //   if (loginController.passwordController.text.isEmpty) {
          //     loginController.passwordError.value = 'Please enter password';
          //     return;
          //   }
          //   loginController.login(context);
          // }, title: 'Login'),
          // SizedBox(height: ResponsiveScale.of(context).hp(2)),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     const Text('Don\'t have an account?'),
          //     TextButton(onPressed: (){
          //       Navigator.pushNamed(context, RouteNames.registerView);
          //     }, child: Text('Sign Up',style: TextStyle(color: ColorUtils.baseColor)))
          //   ],
          // )

        ],
      ),
    );
  }
}