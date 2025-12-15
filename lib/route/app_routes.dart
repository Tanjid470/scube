part of 'app_pages.dart';

abstract class RouteNames {
  RouteNames._();

  static const loginView = _Paths.loginView;
  static const scmView = _Paths.scmView;
  static const noDataView = _Paths.noDataView;
  static const scmDataDetailsView = _Paths.scmDataDetailsView;
}

abstract class _Paths {
  _Paths._();
  static const loginView = '/login_view';
  static const scmView = '/home_view';
  static const noDataView = '/no_data_view';
  static const scmDataDetailsView = '/scm_data_details_view';
}