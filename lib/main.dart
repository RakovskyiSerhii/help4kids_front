import 'package:flutter/material.dart';
import 'package:help4kids_front/core/app_widget.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:help4kids_front/core/maintenance/maintenance_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  
  // Initialize maintenance service to check saved token
  await MaintenanceService.initialize();
  
  runApp(const AppWidget(initialThemeMode: ThemeMode.light));
}
