part of '../app_widget.dart';

/// Theme of the application
///
/// Avoid using locally defined colors, text styles, text field styles in the code.
/// Use theme as much as possible.
///
/// See [AppColorScheme], [AppTypography] if you need to add custom items.
/// See [ThemeDataExtension], [ContextExtension.theme] extensions to
/// get easier access to theme components.
final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    // Custom colors
    _darkAppColorsScheme,
    // Custom text styles
    _appTypography,
  ],
  textTheme: _textTheme.apply(
    displayColor: AppColors.darkTextColor,
    bodyColor: AppColors.darkTextSecondaryColor,
  ),
  colorScheme: _darkColorScheme,
  inputDecorationTheme: _inputDecorationTheme(true),
  elevatedButtonTheme: _elevatedButtonTheme(true),
  textButtonTheme: _textButtonTheme,
  appBarTheme: _appBarTheme(true),
  actionIconTheme: _actionIconTheme(true),
  bottomNavigationBarTheme: _bottomNavigationBarTheme(true),
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  outlinedButtonTheme: _outlinedButtonTheme(true),
  listTileTheme: _listTileTheme(true),
  popupMenuTheme: _popupMenuTheme(true),
  dialogTheme: _dialogTheme(true),
);

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    // Custom colors
    _lightAppColorsScheme,
    // Custom text styles
    _appTypography,
  ],
  textTheme: _textTheme.apply(
    displayColor: AppColors.lightTextColor,
    bodyColor: AppColors.lightTextSecondaryColor,
  ),
  colorScheme: _lightColorScheme,
  inputDecorationTheme: _inputDecorationTheme(false),
  elevatedButtonTheme: _elevatedButtonTheme(false),
  textButtonTheme: _textButtonTheme,
  appBarTheme: _appBarTheme(false),
  actionIconTheme: _actionIconTheme(false),
  bottomNavigationBarTheme: _bottomNavigationBarTheme(false),
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  outlinedButtonTheme: _outlinedButtonTheme(false),
  listTileTheme: _listTileTheme(false),
  popupMenuTheme: _popupMenuTheme(false),
  dialogTheme: _dialogTheme(false),
);

final _darkColorScheme = ColorScheme.fromSwatch(
  backgroundColor: AppColors.darkBackgroundColor,
  brightness: Brightness.dark,
).copyWith(
  primary: AppColors.darkPrimaryColor,
  onPrimary: Colors.black,
  secondary: AppColors.darkSecondaryColor,
  surface: AppColors.darkSurfaceColor,
  onSurface: AppColors.darkTextColor,
);

final _lightColorScheme = ColorScheme.fromSwatch(
  backgroundColor: AppColors.lightBackgroundColor,
  brightness: Brightness.light,
).copyWith(
  primary: AppColors.lightPrimaryColor,
  onPrimary: Colors.black,
  secondary: AppColors.lightSecondaryColor,
  surface: AppColors.lightBackgroundColor,
  onSurface: AppColors.lightTextColor,
);

TextStyle _poppins({double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
  );
}

final _textTheme = TextTheme(
  // H1
  headlineMedium: _poppins(fontSize: 32, fontWeight: FontWeight.w500),
  // H2
  headlineSmall: _poppins(fontSize: 24, fontWeight: FontWeight.w500),
  // H3
  titleLarge: _poppins(fontSize: 18, fontWeight: FontWeight.w500),
  // H4
  titleMedium: _poppins(fontSize: 16, fontWeight: FontWeight.w500),
  // H5
  titleSmall: _poppins(fontSize: 14, fontWeight: FontWeight.w500),
  // Body
  bodyLarge: _poppins(fontSize: 16, fontWeight: FontWeight.w400),
  bodyMedium: _poppins(fontSize: 14, fontWeight: FontWeight.w400),
  bodySmall: _poppins(fontSize: 12, fontWeight: FontWeight.w400),
  // Label
  labelSmall: _poppins(fontSize: 10, fontWeight: FontWeight.w400),
  labelMedium: _poppins(fontSize: 13, fontWeight: FontWeight.w400),
);

final _darkAppColorsScheme = AppColorScheme(
  successMainColor: AppColors.darkSuccessMainColor,
  errorMainColor: AppColors.darkErrorMainColor,
  alertMainColor: AppColors.darkAlertMainColor,
  primaryTextColor: AppColors.darkTextColor,
  secondaryTextColor: AppColors.darkTextSecondaryColor,
  primaryButtonBackgroundColor: AppColors.darkPrimaryColor,
  primaryButtonDisabledBackgroundColor:
      AppColors.darkBrandDisabledColor.withOpacity(0.44),
  secondaryButtonBackgroundColor: AppColors.darkSurfaceColor,
  secondaryButtonDisabledBackgroundColor: AppColors.darkSurfaceColor,
  primaryButtonForegroundColor: Colors.black,
  primaryButtonDisabledForegroundColor:
      AppColors.darkBackgroundColor.withOpacity(0.64),
  secondaryButtonForegroundColor: Colors.white,
  secondaryButtonDisabledForegroundColor: AppColors.paletteDarkGreyColor,
  textPlainButtonForegroundColor: Colors.white,
  textPlainButtonDisabledForegroundColor: AppColors.paletteGray600Color,
  textAccentButtonForegroundColor: AppColors.darkPrimaryColor,
  textAccentButtonDisabledForegroundColor: AppColors.darkBrandDisabledColor,
  borderColor: AppColors.darkBorderColor,
  avatarBackgroundColor: AppColors.darkAccentSecondBackgroundColor,
  cardBackgroundColor: AppColors.darkAccentBackgroundColor,
  shadowColor: AppColors.shadowColor,
  myMessageColor: AppColors.primaryPaleColor,
  myMessageTimeColor: AppColors.darkBackgroundColor,
);

final _lightAppColorsScheme = AppColorScheme(
  successMainColor: AppColors.lightSuccessMainColor,
  errorMainColor: AppColors.lightErrorMainColor,
  alertMainColor: AppColors.lightAlertMainColor,
  primaryTextColor: AppColors.lightTextColor,
  secondaryTextColor: AppColors.lightTextSecondaryColor,
  primaryButtonBackgroundColor: AppColors.lightPrimaryColor,
  primaryButtonDisabledBackgroundColor:
      AppColors.lightBrandDisabledColor.withOpacity(0.64),
  secondaryButtonBackgroundColor: AppColors.lightAccentSecondBackgroundColor,
  secondaryButtonDisabledBackgroundColor:
      AppColors.lightAccentSecondBackgroundColor,
  primaryButtonForegroundColor: Colors.black,
  primaryButtonDisabledForegroundColor:
      AppColors.darkBackgroundColor.withOpacity(0.64),
  secondaryButtonForegroundColor: Colors.black,
  secondaryButtonDisabledForegroundColor: AppColors.paletteDarkGreyColor,
  textPlainButtonForegroundColor: Colors.black,
  textPlainButtonDisabledForegroundColor: AppColors.paletteGray600Color,
  textAccentButtonForegroundColor: AppColors.lightPrimaryColor,
  textAccentButtonDisabledForegroundColor: AppColors.lightBrandDisabledColor,
  borderColor: AppColors.lightBorderColor,
  avatarBackgroundColor: AppColors.lightAccentSecondBackgroundColor,
  cardBackgroundColor: AppColors.lightAccentBackgroundColor,
  shadowColor: AppColors.shadowColor,
  myMessageColor: AppColors.primaryPaleLightColor,
  myMessageTimeColor: AppColors.lightTextSecondaryColor,
);

final _appTypography = AppTypography(
  bodyLargeBold: _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
  bodyMediumBold: _textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
  bodySmallBold: _textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
  labelMediumBold:
      _textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w600),
  labelSmallBold: _textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600),
  appBarTitleBig: _poppins(fontSize: 20, fontWeight: FontWeight.w500),
  bodyExtraSmall: _poppins(fontSize: 8, fontWeight: FontWeight.w400),
);

InputDecorationTheme _inputDecorationTheme(bool isDark) {
  return InputDecorationTheme(
    isDense: true,
    constraints: const BoxConstraints(minHeight: 40),
    labelStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.error)) {
          return _textTheme.bodyMedium!.copyWith(
            color: isDark
                ? AppColors.darkErrorMainColor
                : AppColors.lightErrorMainColor,
          );
        }
        return _textTheme.bodyMedium!.copyWith(
          color: isDark
              ? AppColors.darkTextSecondaryColor
              : AppColors.lightTextSecondaryColor,
        );
      },
    ),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith(
      (states) {
        if (states.contains(WidgetState.error)) {
          return _textTheme.bodyMedium!.copyWith(
            color: isDark
                ? AppColors.darkErrorMainColor
                : AppColors.lightErrorMainColor,
          );
        }
        return _textTheme.bodyMedium!.copyWith(
          color: isDark
              ? AppColors.darkTextSecondaryColor
              : AppColors.lightTextSecondaryColor,
        );
      },
    ),
    hintStyle: _textTheme.bodyMedium,
    filled: true,
    fillColor: isDark
        ? AppColors.darkAccentBackgroundColor
        : AppColors.lightAccentBackgroundColor,
    errorMaxLines: 2,
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: isDark
            ? AppColors.darkAccentSecondBackgroundColor
            : AppColors.lightAccentSecondBackgroundColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: isDark
            ? AppColors.darkErrorMainColor
            : AppColors.lightErrorMainColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: isDark
            ? AppColors.darkErrorMainColor
            : AppColors.lightErrorMainColor,
      ),
    ),
    errorStyle: _textTheme.labelSmall!.copyWith(
      color:
          isDark ? AppColors.darkErrorMainColor : AppColors.lightErrorMainColor,
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonTheme(bool isDark) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
      padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.hovered)) {
            return (isDark ? _darkColorScheme : _lightColorScheme)
                .onPrimary
                .withOpacity(0.08);
          }
          if (states.contains(WidgetState.focused) ||
              states.contains(WidgetState.pressed)) {
            return (isDark ? _darkColorScheme : _lightColorScheme)
                .onPrimary
                .withOpacity(0.24);
          }
          return null;
        },
      ),
      elevation: const WidgetStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      textStyle: WidgetStatePropertyAll(_textTheme.titleSmall),
      splashFactory: InkRipple.splashFactory,
    ),
  );
}

final _textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
    splashFactory: NoSplash.splashFactory,
    textStyle: WidgetStatePropertyAll(_textTheme.titleSmall),
  ),
);

AppBarTheme _appBarTheme(bool isDark) {
  return AppBarTheme(
    elevation: 0,
    backgroundColor:
        isDark ? AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
    foregroundColor:
        isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
    surfaceTintColor:
        isDark ? AppColors.darkSurfaceColor : AppColors.lightSurfaceColor,
    titleTextStyle: _textTheme.titleMedium?.copyWith(
      color: isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
    ),
    centerTitle: true,
    toolbarHeight: 72,
  );
}

ActionIconThemeData _actionIconTheme(bool isDark) {
  return ActionIconThemeData(
    backButtonIconBuilder: (context) => Assets.icons.icArrowLeft.svg(
      colorFilter: ColorFilter.mode(
        (isDark ? _darkAppColorsScheme : _lightAppColorsScheme)
            .primaryTextColor,
        BlendMode.srcIn,
      ),
    ),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarTheme(bool isDark) {
  return BottomNavigationBarThemeData(
    backgroundColor: isDark
        ? AppColors.darkAccentSecondBackgroundColor
        : AppColors.lightAccentSecondBackgroundColor,
    selectedItemColor:
        isDark ? AppColors.darkPrimaryColor : AppColors.lightPrimaryColor,
    unselectedItemColor: (isDark ? _darkAppColorsScheme : _lightAppColorsScheme)
        .secondaryTextColor,
    selectedLabelStyle: _appTypography.labelMediumBold,
    unselectedLabelStyle: _textTheme.labelMedium,
  );
}

OutlinedButtonThemeData _outlinedButtonTheme(bool isDark) {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
      padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
      side: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
                color: (isDark ? _darkAppColorsScheme : _lightAppColorsScheme)
                    .secondaryTextColor,
                width: 2);
          }
          return BorderSide(
              color: isDark
                  ? AppColors.darkAccentSecondBackgroundColor
                  : AppColors.lightAccentSecondBackgroundColor,
              width: 2);
        },
      ),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      textStyle: WidgetStatePropertyAll(_textTheme.titleSmall),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return (isDark ? _darkAppColorsScheme : _lightAppColorsScheme)
                .secondaryTextColor;
          }
          return (isDark ? _darkAppColorsScheme : _lightAppColorsScheme)
              .primaryTextColor;
        },
      ),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ),
  );
}

ListTileThemeData _listTileTheme(bool isDark) {
  return ListTileThemeData(
    tileColor: isDark
        ? AppColors.darkAccentBackgroundColor
        : AppColors.lightAccentBackgroundColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textColor: isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
    iconColor: isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
    subtitleTextStyle: _textTheme.bodySmall,
    titleTextStyle: _textTheme.bodyMedium,
  );
}

PopupMenuThemeData _popupMenuTheme(bool isDark) {
  return PopupMenuThemeData(
    color: isDark
        ? AppColors.darkAccentSecondBackgroundColor
        : AppColors.lightAccentSecondBackgroundColor,
    textStyle: _textTheme.titleSmall?.copyWith(
      color: isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    iconColor: isDark ? AppColors.darkTextColor : AppColors.lightTextColor,
    elevation: 0,
  );
}

DialogTheme _dialogTheme(bool isDark) {
  return DialogTheme(
    backgroundColor: isDark
        ? AppColors.darkAccentSecondBackgroundColor
        : AppColors.lightAccentSecondBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
