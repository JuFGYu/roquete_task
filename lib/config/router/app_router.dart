import 'package:go_router/go_router.dart';

import 'package:roquete_task/presentation/screens/screens.dart';
final appRouter = GoRouter(
  routes: [
    GoRoute(
     path: '/',
     builder: (context,state) => const HomeScreen(),
    ),
    
    GoRoute(
     path: '/cubits',
     builder: (context,state) => const CubitScreen(),
    ),
    GoRoute(
     path: '/counter-bloc',
     builder: (context,state) => const BlocScreen(),
    ),
  ]
);