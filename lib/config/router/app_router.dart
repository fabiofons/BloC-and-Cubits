

import 'package:flutter/material.dart';
import 'package:forms_app/presentation/screen/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen()
    ),
    GoRoute(
      path: '/cubits',
      builder: (BuildContext context, GoRouterState state) => const CubitCounterScreen()
    ),
    GoRoute(
      path: '/bloc',
      builder: (BuildContext context, GoRouterState state) => const BlocCounterScreen()
    ),
  ]
);