import 'package:flutter/foundation.dart';

/// Application configuration based on environment
class AppConfig {
  AppConfig._();

  /// API base URL
  static String get apiBaseUrl => 'https://help4kids.com.ua';

  /// Enable debug logging
  static bool get enableDebugLogging => kDebugMode;

  /// App environment name
  static String get environment => kDebugMode ? 'development' : 'production';
}

