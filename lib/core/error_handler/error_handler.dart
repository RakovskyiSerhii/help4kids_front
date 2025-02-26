import 'package:flutter/material.dart';

abstract class ErrorHandler {
  static ErrorHandler of(BuildContext context) {
    return context.findAncestorStateOfType<_ErrorHandlerWidgetState>()!;
  }

  void handle(Exception error, {BuildContext? localContext});
}

class ErrorHandlerWidget extends StatefulWidget {
  final Widget child;
  final BuildContext? Function() navigatedContextProvider;

  const ErrorHandlerWidget({
    super.key,
    required this.child,
    required this.navigatedContextProvider,
  });

  @override
  State<ErrorHandlerWidget> createState() => _ErrorHandlerWidgetState();
}

class _ErrorHandlerWidgetState extends State<ErrorHandlerWidget> implements ErrorHandler {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void handle(Exception error, {BuildContext? localContext}) {
    var context = localContext ?? widget.navigatedContextProvider();
    // if (error is NetworkException) {
    //   _handleNetworkException(error);
    // } else {
    //   context?.showSnackBar(
    //     text: context.localizations.errorSomethingWentWrong,
    //   );
    // }
  }

  void _handleNetworkException(dynamic error) {
    // error.maybeWhen(
    //   badRequest: (error) {
    //     widget.navigatedContextProvider()?.showSnackBar(text: error.message);
    //   },
    //   noInternetConnection: () {
    //     widget.navigatedContextProvider()?.showSnackBar(
    //           text: context.localizations.errorNoInternetConnection,
    //         );
    //   },
    //   notFound: (error) {
    //     widget.navigatedContextProvider()?.showSnackBar(text: error.message);
    //   },
    //   unauthorizedRequest: () {
    //     context.goNamed(Screen.login);
    //   },
    //   forbidden: (error) {
    //     widget.navigatedContextProvider()?.showSnackBar(text: error.message);
    //   },
    //   tooManyRequests: (error) {
    //     if (error is ApiTimeoutError) {
    //       widget.navigatedContextProvider()?.showSnackBar(text: 'Too many requests. Try again in ${error.sec}s');
    //     } else {
    //       widget.navigatedContextProvider()?.showSnackBar(
    //             text: 'Too many requests',
    //           );
    //     }
    //   },
    //   unprocessableEntity: (error) {
    //     if (error is ApiValidationError) {
    //       widget.navigatedContextProvider()?.showSnackBar(text: (error.errors.values.first as List<String>).first);
    //     } else {
    //       widget.navigatedContextProvider()?.showSnackBar(
    //             text: error.message,
    //           );
    //     }
    //   },
    //   orElse: () {
    //     widget.navigatedContextProvider()?.showSnackBar(
    //           text: context.localizations.errorSomethingWentWrong,
    //         );
    //   },
    // );
  }
}
