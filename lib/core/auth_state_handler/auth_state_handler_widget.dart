import 'package:help4kids_front/core/auth_state_handler/bloc/auth_state_handler_bloc.dart';
import 'package:help4kids_front/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStateHandlerWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onUnauthorized;

  const AuthStateHandlerWidget(
      {super.key, required this.child, required this.onUnauthorized});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthStateHandlerBloc>(
      create: (_) => getIt<AuthStateHandlerBloc>(),
      child: BlocConsumer<AuthStateHandlerBloc, AuthStateHandlerState>(
        listener: (context, state) {
          if (!state.isAuthorized) {
            onUnauthorized();
          }
        },
        builder: (context, state) {
          return child;
        },
      ),
    );
  }
}
