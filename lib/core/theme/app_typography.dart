part of '../app_widget.dart';

/// Theme extension for custom text styles
///
/// Add all text style which are needed for the project and don't fit into
/// [ThemeData.textTheme] set of styles.
/// Example:
/// Designer provided the design with some textStyle "MyAwesomeTextStyle".
/// Add the property `final TextStyle myAwesomeTextStyle;` to [AppTypography] and
/// use it in the code as
/// `Theme.of(context).extension<AppTypography>().myAwesomeTextStyle`.
///
/// To define concrete text style value go to [_darkTheme]
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle bodyLargeBold;
  final TextStyle bodyMediumBold;
  final TextStyle bodySmallBold;
  final TextStyle labelMediumBold;
  final TextStyle labelSmallBold;
  final TextStyle appBarTitleBig;
  final TextStyle bodyExtraSmall;

  /// TODO define all custom colors here

  const AppTypography({
    required this.bodyLargeBold,
    required this.bodyMediumBold,
    required this.bodySmallBold,
    required this.labelMediumBold,
    required this.labelSmallBold,
    required this.appBarTitleBig,
    required this.bodyExtraSmall,
  });

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? bodyLargeBold,
    TextStyle? bodyMediumBold,
    TextStyle? bodySmallBold,
    TextStyle? labelMediumBold,
    TextStyle? labelSmallBold,
    TextStyle? appBarTitleBig,
    TextStyle? bodyExtraSmall,
  }) {
    return AppTypography(
      bodyLargeBold: bodyLargeBold ?? this.bodyLargeBold,
      bodyMediumBold: bodyMediumBold ?? this.bodyMediumBold,
      bodySmallBold: bodySmallBold ?? this.bodySmallBold,
      labelMediumBold: labelMediumBold ?? this.labelMediumBold,
      labelSmallBold: labelSmallBold ?? this.labelSmallBold,
      appBarTitleBig: appBarTitleBig ?? this.appBarTitleBig,
      bodyExtraSmall: bodyExtraSmall ?? this.bodyExtraSmall,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) return this;
    return AppTypography(
      bodyLargeBold: bodyLargeBold.lerp(other.bodyLargeBold, t),
      bodyMediumBold: bodyMediumBold.lerp(other.bodyMediumBold, t),
      bodySmallBold: bodySmallBold.lerp(other.bodySmallBold, t),
      labelMediumBold: labelMediumBold.lerp(other.labelMediumBold, t),
      labelSmallBold: labelSmallBold.lerp(other.labelSmallBold, t),
      appBarTitleBig: appBarTitleBig.lerp(other.appBarTitleBig, t),
      bodyExtraSmall: bodyExtraSmall.lerp(other.bodyExtraSmall, t),
    );
  }
}

extension _TextStyleExtension on TextStyle {
  TextStyle lerp(TextStyle? other, double t) {
    return TextStyle.lerp(this, other, t) ?? this;
  }
}
