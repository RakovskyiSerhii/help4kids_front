part of '../app_widget.dart';

/// Helper function to check maintenance mode and redirect if needed
String? _checkMaintenanceMode(BuildContext context, GoRouterState state) {
  final urlToken = state.uri.queryParameters['maintenance_token'] ?? 
                  state.uri.queryParameters['token'];
  // Use sync version for redirect callback
  if (!MaintenanceService.hasAccessSync(urlToken: urlToken)) {
    return '/maintenance';
  }
  return null;
}

_appRouter(
  GlobalKey<NavigatorState> rootNavigatorKey,
  GlobalKey<NavigatorState> shellNavigatorKey, {
  bool loginInitial = false,
}) =>
    GoRouter.routingConfig(
      navigatorKey: rootNavigatorKey,
      initialLocation: loginInitial ? '/welcome/login' : '/',
      routingConfig: ValueNotifier(RoutingConfig(routes: [
        // Maintenance route - must be first to catch all routes
        GoRoute(
          path: '/maintenance',
          name: 'maintenance',
          builder: (context, state) => const MaintenanceScreen(),
        ),
        GoRoute(
          path: '/',
          name: Screen.initial,
          redirect: _checkMaintenanceMode,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/services',
          name: Screen.services,
          redirect: _checkMaintenanceMode,
          builder: (context, state) {
            final initialCategoryId =
                state.uri.queryParameters['categoryId'];
            return ServicesScreen(initialCategoryId: initialCategoryId);
          },
        ),
        GoRoute(
          path: '/articles',
          name: Screen.articles,
          redirect: _checkMaintenanceMode,
          builder: (context, state) => const ArticlesScreen(),
        ),
        GoRoute(
          path: '/courses',
          name: Screen.courses,
          redirect: _checkMaintenanceMode,
          builder: (context, state) => const CoursesScreen(),
        ),
        GoRoute(
          path: '/consultations',
          name: Screen.consultations,
          redirect: _checkMaintenanceMode,
          builder: (context, state) => const ConsultationsScreen(),
        ),
        GoRoute(
          path: '/consultation',
          name: Screen.consultationDetail,
          redirect: _checkMaintenanceMode,
          builder: (context, state) {
            final consultationId = state.uri.queryParameters['id'];
            if (consultationId == null || consultationId.isEmpty) {
              // Redirect to consultations list if no ID provided
              return const ConsultationsScreen();
            }
            return ConsultationDetailScreen(id: consultationId);
          },
        ),
        GoRoute(
          path: '/verify/:token',
          name: 'verify',
          // Allow verify email route even in maintenance mode
          // as it's critical for user registration
          builder: (context, state) {
            final token = state.pathParameters['token'] ?? '';
            return VerifyEmailPage(token: token);
          },
        ),
        GoRoute(
          path: '/profile',
          name: Screen.profile,
          redirect: _checkMaintenanceMode,
          builder: (context, state) => const ProfileScreen(),
        ),
      ])),
    );
