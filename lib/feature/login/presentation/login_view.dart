import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'package:scube/config/responsive_scale.dart';
import 'package:scube/core/const/app_images.dart';
import 'package:scube/core/const/color_utils.dart';
import 'package:scube/feature/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:scube/global/base_button.dart';
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
            backgroundColor: ColorUtils.baseColor,
            body: _body()
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: _upperBody(),
        ),
        Expanded(
          flex: 8,
            child: _lowerBody()
        ),
      ],
    );
  }

  Widget _upperBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.loginLogo,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.2,
          fit: BoxFit.contain,
        ),
        SizedBox(height: ResponsiveScale.of(context).hp(1)),
        Text('SCUBE',style: TextStyle(color: ColorUtils.white,fontSize: TextSize.font24(context),fontWeight: FontWeight.w600)),
        Text('Control & Monitoring System',style: TextStyle(color: ColorUtils.white,fontSize: TextSize.font22(context),fontWeight: FontWeight.w600))
      ]
    );
  }

  Widget _lowerBody() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: ResponsiveScale.of(context).hp(5)),
            Text('Login',style: TextStyle(
              fontSize: TextSize.font24(context),
              fontWeight: FontWeight.w700
              )),
            SizedBox(height: ResponsiveScale.of(context).hp(3)),
            _form(),
            SizedBox(height: ResponsiveScale.of(context).hp(2)),
            BaseButton(onClick: (){
              Navigator.pushNamed(context, RouteNames.scmView);
            }, title: 'Login'),
            SizedBox(height: ResponsiveScale.of(context).hp(1)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Text('Don\'t have an account?',style: TextStyle(fontSize: TextSize.font14(context))),
                Text('Register Now',style: TextStyle(color: ColorUtils.baseColor,fontSize: TextSize.font16(context),fontWeight: FontWeight.w600))
              ],
            )

          ],
        ),
      ),
    );
  }

  Widget _form(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
        Obx((){
          return KField(
            hideHeadline: true,
            hintText: 'Username',
            controller: loginController.emailController,
            errorText: loginController.emailError.value,
            borderColor: ColorUtils.baseColor,
            onChanged: (_) => loginController.emailError.value = Validators.validateEmail(loginController.emailController.text) ?? '',
            onTap: null,
            noPrefix: true,
            keyboardType: TextInputType.emailAddress,
          );
        }),
        SizedBox(height: ResponsiveScale.of(context).hp(1)),
        Obx((){
          return KField(
            hideHeadline: true,
            hintText: 'Password',
            controller: loginController.passwordController,
            errorText: loginController.passwordError.value,
            onChanged: (_) => loginController.passwordError.value = Validators.validatePassword(loginController.passwordController.text) ?? '',
            onTap: null,
            noPrefix: true,
            keyboardType: TextInputType.emailAddress,
            showPassIcon: true,
          );
        }),
        SizedBox(height: ResponsiveScale.of(context).hp(1)),
        Text('Forget password?',style: TextStyle(
          fontSize: TextSize.font14(context),
          color: ColorUtils.black54,
          decoration: TextDecoration.underline,
        )),
      ]
    );
  }
}

