import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help4kids_front/core/error_handler/error_placeholder.dart';
import 'package:help4kids_front/core/extension/context_extension.dart';
import 'package:help4kids_front/core/routing/screens.dart';
import 'package:help4kids_front/presentation/pages/widgets/progress_widget.dart';

/// Handles [error] by placeholder or redirecting to relevant screen
///
/// Shows error placeholder with retry button or redirects to login screen
/// if [error] is [NetworkException.unauthorizedRequest]
class ErrorWidget extends StatefulWidget {
  final Exception error;
  final VoidCallback onRetry;

  const ErrorWidget({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  State<ErrorWidget> createState() => _ErrorWidgetState();
}

class _ErrorWidgetState extends State<ErrorWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _handleErrorEvent();
    });
  }

  @override
  void didUpdateWidget(covariant ErrorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.error != oldWidget.error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // _handleErrorEvent();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var error = widget.error;
    // if (error is NetworkException) {
    //   return error.maybeWhen(
    //     unauthorizedRequest: () => const ProgressWidget(),
    //     noInternetConnection: () => ErrorPlaceholder(
    //       text: context.localizations.errorNoInternetConnection,
    //       onRetry: widget.onRetry,
    //     ),
    //     orElse: () => ErrorPlaceholder(
    //       text: context.localizations.errorSomethingWentWrong,
    //       onRetry: widget.onRetry,
    //     ),
    //   );
    // } else {
    //   return ErrorPlaceholder(
    //     text: context.localizations.errorSomethingWentWrong,
    //     onRetry: widget.onRetry,
    //   );
    // }
    return ErrorPlaceholder(
      text: 'Something went wrong',
      onRetry: widget.onRetry,
    );
  }

  // void _handleErrorEvent() {
  //   var error = widget.error;
  //   if (error is NetworkException) {
  //     error.whenOrNull(
  //       unauthorizedRequest: () {
  //         context.goNamed(Screen.login);
  //       },
  //     );
  //   }
  // }
}
