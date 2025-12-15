part of 'app_pages.dart';

abstract class RouteNames {
  RouteNames._();

  static const loginView = _Paths.loginView;
  static const scmView = _Paths.scmView;
}

abstract class _Paths {
  _Paths._();
  static const loginView = '/login_view';
  static const scmView = '/home_view';
}