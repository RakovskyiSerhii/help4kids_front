import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/value_carrier.dart';
import 'package:injectable/injectable.dart';

part 'auth_state_handler_bloc.freezed.dart';
part 'auth_state_handler_event.dart';
part 'auth_state_handler_state.dart';

@Injectable()
class AuthStateHandlerBloc extends Bloc<AuthStateHandlerEvent, AuthStateHandlerState> {
  final AuthorizationStateCarrier _authStateCarrier;

  AuthStateHandlerBloc(this._authStateCarrier) : super(AuthStateHandlerState.initial()) {
    _authStateCarrier.stream.listen((event) {
      add(AuthStateHandlerEvent.toggleState(event));
    });

    on<AuthStateHandlerEvent>((event, emit) {
      event.when(
        toggleState: (isAuthorized) {
          if (state.isAuthorized == isAuthorized) return;
          emit(AuthStateHandlerState(isAuthorized: isAuthorized));
        },
      );
    });
  }
}
