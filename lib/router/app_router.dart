import 'package:dekitane/screens/home_screen.dart';
import 'package:dekitane/screens/admin/admin_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dekitane/screens/admin/task/task_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/admin/home',
      name: 'adminHome',
      builder: (context, state) => const adminHomeScreen(),
    ),
    GoRoute(
      path: '/admin/task',
      name: 'adminTask',
      builder: (context, state) => const TaskScreen(),
    ),
  ],
);

