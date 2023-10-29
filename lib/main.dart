import 'package:flutter/material.dart';
import 'package:kucc_app/routes.dart';

const APP_NAME = "KUCC";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      //theme: ThemeData(
      //  brightness: Brightness.light,
      //  primarySwatch: AppColors.getMaterialColorFromColor(settingViewModel.selectedPrimaryColor),
      //  primaryColor: settingViewModel.selectedPrimaryColor,
      //),
      //darkTheme: ThemeData(
      //  brightness: Brightness.dark,
      //  primarySwatch: AppColors.getMaterialColorFromColor(settingViewModel.selectedPrimaryColor),
      //  primaryColor: settingViewModel.selectedPrimaryColor,
      //),
    );
  }
}
