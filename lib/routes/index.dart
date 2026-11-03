import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routers = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Home Page'))),
    ),
    GoRoute(
      path: '/auth',
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('Login Page'))),
        ),
        GoRoute(
          path: 'register',
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('Register Page'))),
        ),
      ],
    ),
  ],
);

Widget getRootRouter() {
  return MaterialApp.router(routerConfig: routers);
}
