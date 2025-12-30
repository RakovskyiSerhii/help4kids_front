part of 'auth_state_handler_bloc.dart';

@freezed
sealed class AuthStateHandlerEvent with _$AuthStateHandlerEvent {
  const factory AuthStateHandlerEvent.toggleState(bool isAuthorized) =
      _ToggleState;
}
