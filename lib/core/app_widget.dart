import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/auth_state_handler/auth_state_handler_widget.dart';
import 'package:help4kids_front/core/error_handler/error_handler.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/core/theme/app_colors.dart';
import 'package:help4kids_front/gen/assets.gen.dart';
import 'package:help4kids_front/generated/l10n.dart';
import 'package:help4kids_front/presentation/pages/articles/articles_screen.dart';
import 'package:help4kids_front/presentation/pages/consultations/consultations_screen.dart';
import 'package:help4kids_front/presentation/pages/consultations/details/consultation_detail_screen.dart';
import 'package:help4kids_front/presentation/pages/cources/courses_screen.dart';
import 'package:help4kids_front/presentation/pages/home/home_screen.dart';
import 'package:help4kids_front/presentation/pages/profile/profile_screen.dart';
import 'package:help4kids_front/presentation/pages/services/services_screen.dart';
import 'package:help4kids_front/presentation/pages/verify_email/verify_email_page.dart';

part 'routing/router.dart';

part 'theme/app_color_scheme.dart';

part 'theme/app_theme.dart';

part 'theme/app_typography.dart';

class AppWidget extends StatefulWidget {
  final ThemeMode initialThemeMode;

  const AppWidget({super.key, required this.initialThemeMode});

  @override
  State<AppWidget> createState() => _AppWidgetState();

  // ignore: library_private_types_in_public_api
  static _AppWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppWidgetState>()!;
  }
}

class _AppWidgetState extends State<AppWidget> {
  var _rootNavigatorKey = GlobalKey<NavigatorState>();
  var _shellNavigatorKey = GlobalKey<NavigatorState>();
  late GoRouter _router = _appRouter(_rootNavigatorKey, _shellNavigatorKey);
  late ThemeMode _themeMode = widget.initialThemeMode;

  void _resetNavigator() {
    setState(() {
      _rootNavigatorKey = GlobalKey<NavigatorState>();
      _shellNavigatorKey = GlobalKey<NavigatorState>();
      _router = _appRouter(
        _rootNavigatorKey,
        _shellNavigatorKey,
        loginInitial: true,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _themeMode,
      routerConfig: _router,
      // routerDelegate: _router.routerDelegate,

      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale("uk_UA"),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return AuthStateHandlerWidget(
          child: ErrorHandlerWidget(
            navigatedContextProvider: () => _rootNavigatorKey.currentContext,
            child: child ?? const SizedBox.shrink(),
          ),
          onUnauthorized: () {
            _resetNavigator();
          },
        );
      },
    );
  }

  void setTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  ThemeMode get themeMode => _themeMode;
}
