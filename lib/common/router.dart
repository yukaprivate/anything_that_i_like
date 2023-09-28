import 'package:anything_that_i_like/screen/calender_list_screen.dart';
import 'package:anything_that_i_like/screen/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// アプリのルートナビゲーションキー
final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'root');
});

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: '/',
    navigatorKey: ref.watch(navigatorKeyProvider),
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePageScreen(),
      ),
      GoRoute(
        path: '/calenderList',
        name: CalenderListScreen.name,
        builder: (context, state) => const CalenderListScreen(),
        routes: [
          GoRoute(
            path: 'yy',
            name: HomePageScreen.name,
            builder: (context, state) => const HomePageScreen(),
          ),
        ],
      ),
    ],
  );
});