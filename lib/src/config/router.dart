import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../domain/models/radio_channel.dart';
import '../presentation/channel_player/view/channel_player_screen.dart';
import '../presentation/home/view/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/player',
      name: 'player',
      builder: (BuildContext context, GoRouterState state) {
        Map<String, dynamic> arguments = state.extra as Map<String, dynamic>;
        RadioChannel radioChannel = arguments['radioChannel'];
        return ChannelPlayerScreen(radioChannel: radioChannel);
      },
    ),
  ],
);
