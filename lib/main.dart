import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/constants/theme.dart';
import 'package:kucc_app/core/push_notification/service/firebase_api.dart';
import 'package:kucc_app/core/push_notification/service/notification_api.dart';
import 'package:kucc_app/firebase_options.dart';
import 'package:kucc_app/routes.dart';
import 'package:kucc_app/viewmodels/bottom_nav_bar_viewmodel.dart';
import 'package:kucc_app/viewmodels/eventdetail_viewmodel.dart';
import 'package:kucc_app/viewmodels/routine_viewmodel.dart';
import 'package:kucc_app/viewmodels/signup_login_viewmodel.dart';
import 'package:kucc_app/viewmodels/timeline_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

const appName = "KUCC";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseApi.initNotificationFirebase();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SignupLoginViewModel()),
      ChangeNotifierProvider(create: (_) => TimeLineViewModel()),
      ChangeNotifierProvider(create: (_) => EventDetailViewModel()),
      ChangeNotifierProvider(create: (_) => RoutineViewModel()),
      ChangeNotifierProvider(create: (_) => BottomNavBarViewModel()),
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
