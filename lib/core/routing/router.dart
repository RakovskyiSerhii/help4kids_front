part of '../app_widget.dart';

_appRouter(
  GlobalKey<NavigatorState> rootNavigatorKey,
  GlobalKey<NavigatorState> shellNavigatorKey, {
  bool loginInitial = false,
}) =>
    GoRouter.routingConfig(
      navigatorKey: rootNavigatorKey,
      initialLocation: loginInitial ? '/welcome/login' : '/',
      routingConfig: ValueNotifier(RoutingConfig(routes: [
        GoRoute(
          path: '/',
          name: Screen.initial,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/services',
          name: Screen.services,
          builder: (context, state) {
            final initialCategoryId =
                state.uri.queryParameters['categoryId'];
            return ServicesScreen(initialCategoryId: initialCategoryId);
          },
        ),
        GoRoute(
          path: '/articles',
          name: Screen.articles,
          builder: (context, state) => const ArticlesScreen(),
        ),
        GoRoute(
          path: '/courses',
          name: Screen.courses,
          builder: (context, state) => const CoursesScreen(),
        ),
        GoRoute(
          path: '/consultations',
          name: Screen.consultations,
          builder: (context, state) => const ConsultationsScreen(),
          routes: [
            GoRoute(
              path: ':consultationId',
              name: Screen.consultationDetail,
              builder: (context, state) {
                final consultationId = state.pathParameters['consultationId']!;
                return ConsultationDetailScreen(id: consultationId,);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/verify/:token',
          name: 'verify',
          builder: (context, state) {
            final token = state.pathParameters['token'] ?? '';
            return VerifyEmailPage(token: token);
          },
        ),
        GoRoute(
          path: '/profile',
          name: Screen.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ])),
    );
