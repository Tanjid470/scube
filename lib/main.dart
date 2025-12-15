import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/feature/login/presentation/login_view.dart';
import 'package:scube/route/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';


final navigatorKey = GlobalKey<NavigatorState>();

late SharedPreferences preferences;
int? isInitScreen;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  preferences = await SharedPreferences.getInstance();
  isInitScreen = preferences.getInt('initScreen');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      title: 'Scube',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: true,
      home: const LoginView(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorKey: navigatorKey,
    );
  }
}