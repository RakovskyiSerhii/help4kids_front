part of '../app_widget.dart';

/// Helper function to create a page without transitions
Page<T> _noTransitionPage<T extends Object?>(
  Widget child, {
  LocalKey? key,
  String? name,
  Object? arguments,
  String? restorationId,
}) {
  return NoTransitionPage<T>(
    key: key,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    child: child,
  );
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
        GoRoute(
          path: '/',
          name: Screen.initial,
          pageBuilder: (context, state) => _noTransitionPage(
            const HomeScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          path: '/services',
          name: Screen.services,
          pageBuilder: (context, state) {
            final initialCategoryId =
                state.uri.queryParameters['categoryId'];
            return _noTransitionPage(
              ServicesScreen(initialCategoryId: initialCategoryId),
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/articles',
          name: Screen.articles,
          pageBuilder: (context, state) => _noTransitionPage(
            const ArticlesScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          path: '/courses',
          name: Screen.courses,
          pageBuilder: (context, state) => _noTransitionPage(
            const CoursesScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          path: '/consultations',
          name: Screen.consultations,
          pageBuilder: (context, state) => _noTransitionPage(
            const ConsultationsScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          path: '/consultation',
          name: Screen.consultationDetail,
          pageBuilder: (context, state) {
            final consultationId = state.uri.queryParameters['id'];
            if (consultationId == null || consultationId.isEmpty) {
              // Redirect to consultations list if no ID provided
              return _noTransitionPage(
                const ConsultationsScreen(),
                key: state.pageKey,
              );
            }
            // Include consultation ID in the page key to force rebuild when ID changes
            return _noTransitionPage(
              ConsultationDetailScreen(id: consultationId),
              key: ValueKey('consultation-${consultationId}'),
            );
          },
        ),
        GoRoute(
          path: '/verify/:token',
          name: 'verify',
          pageBuilder: (context, state) {
            final token = state.pathParameters['token'] ?? '';
            return _noTransitionPage(
              VerifyEmailPage(token: token),
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/profile',
          name: Screen.profile,
          pageBuilder: (context, state) => _noTransitionPage(
            const ProfileScreen(),
            key: state.pageKey,
          ),
        ),
        GoRoute(
          path: '/payment/success',
          name: Screen.paymentSuccess,
          pageBuilder: (context, state) => _noTransitionPage(
            const PaymentSuccessScreen(),
            key: state.pageKey,
          ),
        ),
      ])),
    );
