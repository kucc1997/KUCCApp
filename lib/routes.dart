import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/views/components/scaffold_with_nav_bar.dart';
import 'package:kucc_app/views/pages/home/home.dart';
import 'package:kucc_app/views/pages/routine/routine.dart';
import 'package:kucc_app/views/pages/signup_login/login_signup.dart';
import 'package:kucc_app/views/pages/timeline/timeline.dart';

GoRouter goRouter = GoRouter(routes: [
  GoRoute(
      name: "signuplogin",
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const LoginSignUp();
      },
      routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(routes: [
                GoRoute(
                    name: "events",
                    path: "events",
                    builder: (BuildContext context, GoRouterState state) {
                      return const TimeLine();
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: "home",
                    path: "home",
                    builder: (BuildContext context, GoRouterState state) {
                      return Home();
                    }),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                    name: "settings",
                    path: "settings",
                    builder: (BuildContext context, GoRouterState state) {
                      return const Text("");
                    }),
              ]),
            ])
      ]),
]);

/// NOTE: The index of the routes above directly corresponds to the index while
/// navigation and the navigation bar.

/// Root
/// |- Branch A
/// |- Branch B
///   |- Branch B1
/// |- Branch C
///   |- Branch C1
///   |- Branch C2
/// The [StatefulNavigationShell] is a [StatefulWidget] that manages the
/// [Navigator] for a branch of the app. It is used in conjunction with
/// [StatefulShellRoute] and [StatefulShellBranch] to create a branch of the
/// app that can be navigated to and from independently of other branches.
/// 
