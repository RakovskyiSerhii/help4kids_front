import 'package:flutter/foundation.dart';

/// Application configuration based on environment
class AppConfig {
  AppConfig._();

  /// API base URL
  static String get apiBaseUrl => 'https://help4kids.com.ua';

  /// Booking URL base (Alteg.io)
  static String get bookingBaseUrl => 'https://n1386681.alteg.io/company/1321277/personal/select-services';

  /// Enable debug logging
  static bool get enableDebugLogging => kDebugMode;

  /// App environment name
  static String get environment => kDebugMode ? 'development' : 'production';
}

