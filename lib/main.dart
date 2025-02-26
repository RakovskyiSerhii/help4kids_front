import 'package:flutter/material.dart';
import 'package:help4kids_front/core/app_widget.dart';
import 'package:help4kids_front/core/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const AppWidget(initialThemeMode: ThemeMode.light));
}
