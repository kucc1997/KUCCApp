import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/views/pages/home/home.dart';
import 'package:kucc_app/views/pages/signup_login/login_signup.dart';

GoRouter goRouter = GoRouter(routes: [
  GoRoute(
      name: "signuplogin",
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const LoginSignUp();
      },
      routes: [
        GoRoute(
            name: "home",
            path: "home",
            builder: (BuildContext context, GoRouterState state) {
              return Home();
            }),
        GoRoute(
            name: "settings",
            path: "settings",
            builder: (BuildContext context, GoRouterState state) {
              return const Text("");
            }),
      ]),
]);
