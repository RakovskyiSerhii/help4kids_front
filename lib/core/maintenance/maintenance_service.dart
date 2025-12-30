import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service to manage maintenance mode access control
class MaintenanceService {
  /// Set to true to enable maintenance mode
  /// In production, this could be loaded from a remote config or environment variable
  static const bool isMaintenanceModeEnabled = true;

  /// The token required to bypass maintenance mode
  /// In production, this should be a secure token stored in environment variables
  static const String maintenanceBypassToken = 'help4kids-maintenance-2024';

  /// Key for storing the validated maintenance token
  static const String _maintenanceTokenKey = 'maintenance_bypass_token';

  /// Cached access result to avoid repeated async checks
  static bool? _cachedAccessResult;
  static String? _cachedToken;

  /// Initialize maintenance service by checking saved token
  /// Call this in app initialization
  static Future<void> initialize() async {
    if (kDebugMode || !isMaintenanceModeEnabled) {
      _cachedAccessResult = true;
      return;
    }

    final savedToken = await _getSavedToken();
    if (savedToken == maintenanceBypassToken) {
      _cachedAccessResult = true;
      _cachedToken = savedToken;
    } else {
      _cachedAccessResult = false;
    }
  }

  /// Check if the user has access to the app
  /// Returns true if:
  /// - Maintenance mode is disabled, OR
  /// - App is running in debug mode, OR
  /// - URL contains the correct maintenance token (which will be saved), OR
  /// - A valid maintenance token was previously saved
  static Future<bool> hasAccess({String? urlToken}) async {
    // If maintenance mode is disabled, allow access
    if (!isMaintenanceModeEnabled) {
      return true;
    }

    // Allow access in debug mode
    if (kDebugMode) {
      return true;
    }

    // If URL token is provided and matches, save it and allow access
    if (urlToken != null && urlToken == maintenanceBypassToken) {
      await _saveToken(urlToken);
      return true;
    }

    // Check if a valid token was previously saved
    final savedToken = await _getSavedToken();
    if (savedToken == maintenanceBypassToken) {
      return true;
    }

    // Otherwise, deny access
    return false;
  }

  /// Synchronous version for use in redirect callbacks
  /// Uses cached result from initialize() or checks URL token
  static bool hasAccessSync({String? urlToken}) {
    // If maintenance mode is disabled, allow access
    if (!isMaintenanceModeEnabled) {
      return true;
    }

    // Allow access in debug mode
    if (kDebugMode) {
      return true;
    }

    // If URL token is provided and matches, allow access and cache it
    if (urlToken != null && urlToken == maintenanceBypassToken) {
      _cachedAccessResult = true;
      _cachedToken = urlToken;
      // Save token asynchronously (fire and forget)
      _saveToken(urlToken);
      return true;
    }

    // Use cached result if available
    if (_cachedAccessResult != null) {
      return _cachedAccessResult!;
    }

    // If no cached result and no valid URL token, deny access
    return false;
  }

  /// Save the maintenance token to persistent storage
  static Future<void> _saveToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_maintenanceTokenKey, token);
    } catch (e) {
      // Silently fail - token saving is not critical
      debugPrint('Failed to save maintenance token: $e');
    }
  }

  /// Get the saved maintenance token from persistent storage
  static Future<String?> _getSavedToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_maintenanceTokenKey);
    } catch (e) {
      // Silently fail - return null if we can't read
      debugPrint('Failed to read maintenance token: $e');
      return null;
    }
  }

  /// Clear the saved maintenance token
  static Future<void> clearToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_maintenanceTokenKey);
    } catch (e) {
      debugPrint('Failed to clear maintenance token: $e');
    }
  }

  /// Extract maintenance token from URL query parameters
  static String? extractTokenFromUrl(String? url) {
    if (url == null || url.isEmpty) {
      return null;
    }

    try {
      final uri = Uri.parse(url);
      return uri.queryParameters['maintenance_token'] ?? 
             uri.queryParameters['token'];
    } catch (e) {
      return null;
    }
  }
}

