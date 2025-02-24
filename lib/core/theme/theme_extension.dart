import 'package:help4kids_front/core/app_widget.dart';
import 'package:flutter/material.dart';


/// Extension to make access to theme extension easier
///
/// Usage:
/// instead of `Theme.of(context).extension<AppColorScheme>()`
/// use `Theme.of(context).appColors` or with context extension:
/// `context.theme.appColors`
extension ThemeDataExtension on ThemeData {
  AppColorScheme get appColors => extension<AppColorScheme>()!;

  AppTypography get appTypography => extension<AppTypography>()!;
}
