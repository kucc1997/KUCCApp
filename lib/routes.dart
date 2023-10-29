import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

GoRouter goRouter = GoRouter(routes: [
  GoRoute(
      name: "home",
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const Text("");
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
