import 'package:dekitane/screens/home_screen.dart';
import 'package:dekitane/screens/admin/admin_home_screen.dart';
import 'package:dekitane/usecase/create_task_usecase.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dekitane/screens/admin/task/task_screen.dart';
import 'package:dekitane/api/task_api.dart';
import 'package:dekitane/repository/task_repository.dart';
import 'package:dekitane/screens/admin/ticket/ticket_screen.dart';
import 'package:dekitane/api/ticket_api.dart';
import 'package:dekitane/repository/ticket_repository.dart';
import 'package:dekitane/usecase/create_ticket_usecase.dart';

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
      builder: (context, state) {
        final taskApi = TaskApi();
        final repository = TaskRepository(taskApi: taskApi);
        final createTaskUseCase = CreateTaskUseCase(repository: repository);
        return TaskScreen(createTaskUseCase: createTaskUseCase);
      },
    ),
    GoRoute(
      path: '/admin/ticket',
      name: 'adminTicket',
      builder: (context, state) {
        final ticketApi = TicketApi();
        final repository = TicketRepository(ticketApi: ticketApi);
        final createTicketUseCase = CreateTicketUseCase(repository: repository);
        return TicketScreen(createTicketUseCase: createTicketUseCase);
      },
    ),
  ],
);

