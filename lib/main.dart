import 'package:flutter/material.dart';
import 'package:kucc_app/constants/theme.dart';
import 'package:kucc_app/routes.dart';
import 'package:kucc_app/viewmodels/eventdetail_viewmodel.dart';
import 'package:kucc_app/viewmodels/signup_login_viewmodel.dart';
import 'package:kucc_app/viewmodels/timeline_viewmodel.dart';
import 'package:provider/provider.dart';

const appName = "KUCC";

void main() {
  SignupLoginViewModel slvm = SignupLoginViewModel();
  TimeLineViewModel tlvm = TimeLineViewModel();
  EventDetailViewModel edvm = EventDetailViewModel();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => slvm),
      ChangeNotifierProvider(create: (_) => tlvm),
      ChangeNotifierProvider(create: (_) => edvm),
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
      theme: kTheme(),
    );
  }
}
