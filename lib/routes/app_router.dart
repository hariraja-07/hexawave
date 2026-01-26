import 'package:go_router/go_router.dart';
import 'package:hexawave/features/player/view/player_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name:'player',
      builder: (context,state) => const PlayerScreen(),
    ),
  ]
);