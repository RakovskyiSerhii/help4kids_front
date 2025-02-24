import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/error_handler/error_handler.dart';
import 'package:help4kids_front/core/theme/theme_extension.dart';
import 'package:help4kids_front/generated/l10n.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  void showSnackBar({
    required String text,
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    if (!mounted) return;
    var backgroundColor = theme.appColors.avatarBackgroundColor;
    var textTheme = theme.textTheme.bodyMedium
        ?.copyWith(color: theme.appColors.primaryTextColor);
    showFlash(
      context: this,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          position: FlashPosition.bottom,
          child: FlashBar(
            margin: const EdgeInsets.all(8.0),
            content: Text(text, style: textTheme),
            backgroundColor: backgroundColor,
            surfaceTintColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            behavior: FlashBehavior.floating,
            controller: controller, // Optional action
          ),
        );
      },
    );
  }

  ErrorHandler get errorHandler => ErrorHandler.of(this);
}
