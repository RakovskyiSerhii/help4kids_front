import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/theme/theme_extension.dart';

class Buttons {
  static ElevatedButton primary(BuildContext context,
      {VoidCallback? onPressed, String? text, Widget? child}) {
    assert(child != null || text != null,
        'Either text or child must be provided.');
    return ElevatedButton(
      onPressed: onPressed,
      style: context.theme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return context
                  .theme.appColors.primaryButtonDisabledBackgroundColor;
            }
            return context.theme.appColors.primaryButtonBackgroundColor;
          },
        ),
        // ForegroundColor is used for the text color
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return context
                  .theme.appColors.primaryButtonDisabledForegroundColor;
            }
            return context.theme.appColors.primaryButtonForegroundColor;
          },
        ),
      ),
      child: child ?? Text(text!),
    );
  }

  static ElevatedButton primarySmall(BuildContext context,
      {required String text, VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: context.theme.elevatedButtonTheme.style?.copyWith(
        minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(28)),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4)),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return context
                  .theme.appColors.primaryButtonDisabledBackgroundColor;
            }
            return context.theme.appColors.primaryButtonBackgroundColor;
          },
        ),
        // ForegroundColor is used for the text color
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return context
                  .theme.appColors.primaryButtonDisabledForegroundColor;
            }
            return context.theme.appColors.primaryButtonForegroundColor;
          },
        ),
      ),
      child: Text(text),
    );
  }

  static ElevatedButton secondary(BuildContext context,
      {VoidCallback? onPressed, String? text, Widget? child}) {
    assert(child != null || text != null,
        'Either text or child must be provided.');

    return ElevatedButton(
      onPressed: onPressed,
      style: context.theme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context
                .theme.appColors.secondaryButtonDisabledBackgroundColor;
          }
          return context.theme.appColors.secondaryButtonBackgroundColor;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context
                .theme.appColors.secondaryButtonDisabledForegroundColor;
          }
          return context.theme.appColors.secondaryButtonForegroundColor;
        }),
      ),
      child: child ?? Text(text!),
    );
  }

  static TextButton textPlain(BuildContext context,
      {VoidCallback? onPressed, required String text}) {
    return TextButton(
      onPressed: onPressed,
      style: context.theme.textButtonTheme.style?.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context
                .theme.appColors.textPlainButtonDisabledForegroundColor;
          }
          return context.theme.appColors.textPlainButtonForegroundColor;
        }),
      ),
      child: Text(text),
    );
  }

  static TextButton textAccent(BuildContext context,
      {VoidCallback? onPressed, required String text, String? iconAsset}) {
    return TextButton(
      onPressed: onPressed,
      style: context.theme.textButtonTheme.style?.copyWith(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context
                .theme.appColors.textAccentButtonDisabledForegroundColor;
          }
          return context.theme.appColors.textAccentButtonForegroundColor;
        }),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconAsset != null) ...[
            SvgPicture.asset(
              iconAsset,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                onPressed == null
                    ? context
                        .theme.appColors.textAccentButtonDisabledForegroundColor
                    : context.theme.appColors.textAccentButtonForegroundColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Text(text),
        ],
      ),
    );
  }

  static TextButton textDestructive(BuildContext context,
      {VoidCallback? onPressed, required String text, String? iconAsset}) {
    return TextButton(
      onPressed: onPressed,
      style: context.theme.textButtonTheme.style?.copyWith(
        foregroundColor:
            WidgetStateProperty.all(context.theme.appColors.errorMainColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconAsset != null) ...[
            SvgPicture.asset(
              iconAsset,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                  context.theme.appColors.errorMainColor, BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
          ],
          Text(text),
        ],
      ),
    );
  }

  static OutlinedButton outlinedSmall(BuildContext context,
      {required String text, VoidCallback? onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: context.theme.outlinedButtonTheme.style?.copyWith(
        minimumSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(28)),
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4)),
      ),
      child: Text(text),
    );
  }

  static OutlinedButton outlinedButton(BuildContext context,
      {VoidCallback? onPressed, String? text, Widget? child}) {
    assert(child != null || text != null,
        'Either text or child must be provided.');
    return OutlinedButton(
      onPressed: onPressed,
      child: child ?? Text(text!),
    );
  }

  static OutlinedButton outlinedDestructiveButton(BuildContext context,
      {VoidCallback? onPressed, String? text, Widget? child}) {
    assert(child != null || text != null,
        'Either text or child must be provided.');
    return OutlinedButton(
      onPressed: onPressed,
      style: context.theme.textButtonTheme.style?.copyWith(
        side: WidgetStatePropertyAll(
          BorderSide(color: context.theme.appColors.errorMainColor),
        ),
        foregroundColor:
            WidgetStateProperty.all(context.theme.appColors.errorMainColor),
      ),
      child: child ?? Text(text!),
    );
  }
}
