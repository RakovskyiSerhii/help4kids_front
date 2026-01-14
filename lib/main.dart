import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:help4kids_front/core/app_widget.dart';
import 'package:help4kids_front/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Use path-based URL strategy for web (removes # from URLs)
  if (kIsWeb) {
    usePathUrlStrategy();
  }
  
  configureDependencies();
  
  runApp(const AppWidget(initialThemeMode: ThemeMode.light));
}
