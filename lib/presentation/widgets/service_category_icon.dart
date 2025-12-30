import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget to load and display service category icons from the backend
class ServiceCategoryIcon extends StatelessWidget {
  const ServiceCategoryIcon({
    super.key,
    required this.iconUrl,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  /// Icon URL from the database (e.g., "ic_stethoscope.svg")
  final String? iconUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  /// Constructs the full URL for the icon
  String _getIconUrl(String iconName) {
    // Base URL should match the ApiClient baseUrl
    // This is set in AppModule to 'http://173.242.53.114:8080'
    // In production, consider storing this in a config file
    const baseUrl = 'http://173.242.53.114:8080';
    return '$baseUrl/api/icons/$iconName';
  }

  @override
  Widget build(BuildContext context) {
    if (iconUrl == null || iconUrl!.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.medical_services_outlined,
          size: width ?? height ?? 24,
          color: color ?? Theme.of(context).colorScheme.onSurface,
        ),
      );
    }

    return SvgPicture.network(
      _getIconUrl(iconUrl!),
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      fit: fit,
      placeholderBuilder: (context) => SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
      // Error widget if icon fails to load
      semanticsLabel: 'Service category icon',
    );
  }
}

