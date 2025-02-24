part of '../app_widget.dart';

/// Theme extension for custom colors
///
/// Add all colors which are needed for the project and don't fit into
/// [ThemeData.colorScheme] set of colors.
/// Example:
/// Designer provided the design with some color "MyAwesomeColor".
/// Add the property `final Color myAwesomeColor;` to [AppColorScheme] and
/// use it in the code as
/// `Theme.of(context).extension<AppColorScheme>().myAwesomeColor`.
///
/// To define concrete color value go to [_darkTheme]
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color successMainColor;
  final Color errorMainColor;
  final Color alertMainColor;

  final Color primaryTextColor;
  final Color secondaryTextColor;

  final Color primaryButtonBackgroundColor;
  final Color primaryButtonForegroundColor;
  final Color primaryButtonDisabledBackgroundColor;
  final Color primaryButtonDisabledForegroundColor;

  final Color secondaryButtonBackgroundColor;
  final Color secondaryButtonForegroundColor;
  final Color secondaryButtonDisabledBackgroundColor;
  final Color secondaryButtonDisabledForegroundColor;

  final Color textPlainButtonForegroundColor;
  final Color textPlainButtonDisabledForegroundColor;

  final Color textAccentButtonForegroundColor;
  final Color textAccentButtonDisabledForegroundColor;

  final Color borderColor;
  final Color avatarBackgroundColor;
  final Color cardBackgroundColor;
  final Color shadowColor;

  /// TODO define all custom colors here

  final Color myMessageColor;
  final Color myMessageTimeColor;

  const AppColorScheme({
    required this.successMainColor,
    required this.errorMainColor,
    required this.alertMainColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.primaryButtonBackgroundColor,
    required this.primaryButtonDisabledBackgroundColor,
    required this.secondaryButtonBackgroundColor,
    required this.secondaryButtonDisabledBackgroundColor,
    required this.primaryButtonForegroundColor,
    required this.primaryButtonDisabledForegroundColor,
    required this.secondaryButtonForegroundColor,
    required this.secondaryButtonDisabledForegroundColor,
    required this.textPlainButtonForegroundColor,
    required this.textPlainButtonDisabledForegroundColor,
    required this.textAccentButtonForegroundColor,
    required this.textAccentButtonDisabledForegroundColor,
    required this.borderColor,
    required this.avatarBackgroundColor,
    required this.cardBackgroundColor,
    required this.shadowColor,
    required this.myMessageColor,
    required this.myMessageTimeColor,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? successMainColor,
    Color? errorMainColor,
    Color? alertMainColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? primaryButtonBackgroundColor,
    Color? primaryButtonDisabledBackgroundColor,
    Color? secondaryButtonBackgroundColor,
    Color? secondaryButtonDisabledBackgroundColor,
    Color? primaryButtonForegroundColor,
    Color? primaryButtonDisabledForegroundColor,
    Color? secondaryButtonForegroundColor,
    Color? secondaryButtonDisabledForegroundColor,
    Color? textPlainButtonForegroundColor,
    Color? textPlainButtonDisabledForegroundColor,
    Color? textAccentButtonForegroundColor,
    Color? textAccentButtonDisabledForegroundColor,
    Color? borderColor,
    Color? avatarBackgroundColor,
    Color? cardBackgroundColor,
    Color? shadowColor,
    Color? myMessageColor,
    Color? myMessageTimeColor,
  }) {
    return AppColorScheme(
      successMainColor: successMainColor ?? this.successMainColor,
      errorMainColor: errorMainColor ?? this.errorMainColor,
      alertMainColor: alertMainColor ?? this.alertMainColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryButtonBackgroundColor:
          primaryButtonBackgroundColor ?? this.primaryButtonBackgroundColor,
      primaryButtonDisabledBackgroundColor:
          primaryButtonDisabledBackgroundColor ??
              this.primaryButtonDisabledBackgroundColor,
      secondaryButtonBackgroundColor:
          secondaryButtonBackgroundColor ?? this.secondaryButtonBackgroundColor,
      secondaryButtonDisabledBackgroundColor:
          secondaryButtonDisabledBackgroundColor ??
              this.secondaryButtonDisabledBackgroundColor,
      primaryButtonForegroundColor:
          primaryButtonForegroundColor ?? this.primaryButtonForegroundColor,
      primaryButtonDisabledForegroundColor:
          primaryButtonDisabledForegroundColor ??
              this.primaryButtonDisabledForegroundColor,
      secondaryButtonForegroundColor:
          secondaryButtonForegroundColor ?? this.secondaryButtonForegroundColor,
      secondaryButtonDisabledForegroundColor:
          secondaryButtonDisabledForegroundColor ??
              this.secondaryButtonDisabledForegroundColor,
      textPlainButtonForegroundColor:
          textPlainButtonForegroundColor ?? this.textPlainButtonForegroundColor,
      textPlainButtonDisabledForegroundColor:
          textPlainButtonDisabledForegroundColor ??
              this.textPlainButtonDisabledForegroundColor,
      textAccentButtonForegroundColor: textAccentButtonForegroundColor ??
          this.textAccentButtonForegroundColor,
      textAccentButtonDisabledForegroundColor:
          textAccentButtonDisabledForegroundColor ??
              this.textAccentButtonDisabledForegroundColor,
      borderColor: borderColor ?? this.borderColor,
      avatarBackgroundColor:
          avatarBackgroundColor ?? this.avatarBackgroundColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      myMessageColor: myMessageColor ?? this.myMessageColor,
      myMessageTimeColor: myMessageTimeColor ?? this.myMessageTimeColor,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    covariant ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) return this;
    return AppColorScheme(
      successMainColor: successMainColor.lerp(other.successMainColor, t),
      errorMainColor: errorMainColor.lerp(other.errorMainColor, t),
      alertMainColor: alertMainColor.lerp(other.alertMainColor, t),
      primaryTextColor: primaryTextColor.lerp(other.primaryTextColor, t),
      secondaryTextColor: secondaryTextColor.lerp(other.secondaryTextColor, t),
      primaryButtonBackgroundColor: primaryButtonBackgroundColor.lerp(
          other.primaryButtonBackgroundColor, t),
      primaryButtonDisabledBackgroundColor: primaryButtonDisabledBackgroundColor
          .lerp(other.primaryButtonDisabledBackgroundColor, t),
      secondaryButtonBackgroundColor: secondaryButtonBackgroundColor.lerp(
          other.secondaryButtonBackgroundColor, t),
      secondaryButtonDisabledBackgroundColor:
          secondaryButtonDisabledBackgroundColor.lerp(
              other.secondaryButtonDisabledBackgroundColor, t),
      primaryButtonForegroundColor: primaryButtonForegroundColor.lerp(
          other.primaryButtonForegroundColor, t),
      primaryButtonDisabledForegroundColor: primaryButtonDisabledForegroundColor
          .lerp(other.primaryButtonDisabledForegroundColor, t),
      secondaryButtonForegroundColor: secondaryButtonForegroundColor.lerp(
          other.secondaryButtonForegroundColor, t),
      secondaryButtonDisabledForegroundColor:
          secondaryButtonDisabledForegroundColor.lerp(
              other.secondaryButtonDisabledForegroundColor, t),
      textPlainButtonForegroundColor: textPlainButtonForegroundColor.lerp(
          other.textPlainButtonForegroundColor, t),
      textPlainButtonDisabledForegroundColor:
          textPlainButtonDisabledForegroundColor.lerp(
              other.textPlainButtonDisabledForegroundColor, t),
      textAccentButtonForegroundColor: textAccentButtonForegroundColor.lerp(
          other.textAccentButtonForegroundColor, t),
      textAccentButtonDisabledForegroundColor:
          textAccentButtonDisabledForegroundColor.lerp(
              other.textAccentButtonDisabledForegroundColor, t),
      borderColor: borderColor.lerp(other.borderColor, t),
      avatarBackgroundColor:
          avatarBackgroundColor.lerp(other.avatarBackgroundColor, t),
      cardBackgroundColor:
          cardBackgroundColor.lerp(other.cardBackgroundColor, t),
      shadowColor: shadowColor.lerp(other.shadowColor, t),
      myMessageColor: myMessageColor.lerp(other.myMessageColor, t),
      myMessageTimeColor: myMessageTimeColor.lerp(other.myMessageTimeColor, t),
    );
  }
}

extension _ColorExtension on Color {
  Color lerp(Color? other, double t) {
    return Color.lerp(this, other, t) ?? this;
  }
}
