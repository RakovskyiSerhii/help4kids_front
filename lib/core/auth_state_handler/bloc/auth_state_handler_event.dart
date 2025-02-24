part of 'auth_state_handler_bloc.dart';

@freezed
class AuthStateHandlerEvent with _$AuthStateHandlerEvent {
  const factory AuthStateHandlerEvent.toggleState(bool isAuthorized) =
      _ToggleState;
}
