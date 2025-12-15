import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:scube/feature/no_data/presentation/no_data_view.dart';
import 'package:scube/feature/scm/presentation/scm_view.dart';
import 'package:scube/feature/login/presentation/login_view.dart';
import 'package:scube/feature/scm_data_details/presentation/scm_data_details_view.dart';
import 'package:scube/main.dart';
part 'app_routes.dart';

class AppPages{
  AppPages._();

  static String INITIAL = isInitScreen == 0 || isInitScreen == null
      ? RouteNames.loginView
      : RouteNames.scmView;

  static final routes =[
    GetPage(
      name:_Paths.scmView,
      page: () => const SCMView(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.loginView,
      page: () => const LoginView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.noDataView,
      page: () => const NoDataView(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.scmDataDetailsView,
      page: () => const ScmDataDetailsView(),
      transition: Transition.rightToLeft,
      curve: Curves.fastOutSlowIn,
    ),
  ];
}