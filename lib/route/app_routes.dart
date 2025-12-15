part of 'app_pages.dart';

abstract class RouteNames {
  RouteNames._();

  static const loginView = _Paths.loginView;
  static const homeView = _Paths.homeView;
}

abstract class _Paths {
  _Paths._();
  static const loginView = '/login_view';
  static const homeView = '/home_view';
}