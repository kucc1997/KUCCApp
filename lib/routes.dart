import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/views/pages/signup_login/signup_login.dart';

GoRouter goRouter = GoRouter(routes: [
  GoRoute(
      name: "signuplogin",
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const SignupLogin();
      },
      routes: [
        GoRoute(
            name: "case",
            path: "case",
            builder: (BuildContext context, GoRouterState state) {
              return const Text("");
            }),
        GoRoute(
            name: "settings",
            path: "settings",
            builder: (BuildContext context, GoRouterState state) {
              return const Text("");
            }),
      ]),
]);
