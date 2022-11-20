import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stateful_widget/print_page.dart';
import 'package:stateful_widget/profile_edit_page.dart';
import 'package:stateful_widget/tasks_page.dart';

import 'my_name_page.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/profile',
  routes: [
    GoRoute(
      path: '/profile',
      builder: (_, __) => ProfileEditPage(),
    ),
    GoRoute(
      path: '/task',
      builder: (_, __) => TasksPage(),
    ),
    GoRoute(
      path: '/name',
      builder: (_, __) => MyNamePage(),
    ),
    GoRoute(
      path: '/print',
      builder: (_, state) => PrintPage(name: state.extra as String),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
