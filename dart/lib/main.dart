import 'package:chuva_dart/controller/controller.dart';
import 'package:chuva_dart/view/activity_screen.dart';
import 'package:chuva_dart/view/home_calendar.dart';
import 'package:chuva_dart/view/person_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ChuvaDart());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, GoRouterState state) {
        return const Calendar();
      },
      routes: [
        GoRoute(
          path: 'activity',
          builder: (context, GoRouterState state) {
            return Activity(controller: state.extra as Controller);
          },
        ),
        GoRoute(
          path: 'person',
          builder: (context, GoRouterState state) {
            return Person(controller: state.extra as Controller);
          },
        )
      ],
    ),
  ],
);

class ChuvaDart extends StatelessWidget {
  const ChuvaDart({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Chuva ❤️ Flutter',
    );
  }
}
