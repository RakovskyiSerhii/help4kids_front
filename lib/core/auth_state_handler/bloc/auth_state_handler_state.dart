part of 'auth_state_handler_bloc.dart';

@freezed
class AuthStateHandlerState with _$AuthStateHandlerState {
  const factory AuthStateHandlerState({
    required bool isAuthorized,
  }) = _AuthStateHandlerState;

  factory AuthStateHandlerState.initial() => const AuthStateHandlerState(isAuthorized: false);
}
