import 'package:flutter/material.dart';
import 'package:kucc_app/routes.dart';
import 'package:kucc_app/viewmodels/signup_login_viewmodel.dart';
import 'package:provider/provider.dart';

const appName = "KUCC";

void main() {
  SignupLoginViewModel signupLoginViewModel = SignupLoginViewModel();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => signupLoginViewModel),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
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
