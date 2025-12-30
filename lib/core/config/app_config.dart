import 'package:flutter/foundation.dart';

/// Application configuration based on environment
class AppConfig {
  AppConfig._();

  /// API base URL
  static String get apiBaseUrl {
    if (kDebugMode) {
      // Development API URL
      return 'http://173.242.53.114:8080';
    } else {
      // Production API URL - will use same domain with /api prefix
      // Update this to match your production setup
      return 'https://yourdomain.com/api';
    }
  }

  /// Enable debug logging
  static bool get enableDebugLogging => kDebugMode;

  /// App environment name
  static String get environment => kDebugMode ? 'development' : 'production';
}

