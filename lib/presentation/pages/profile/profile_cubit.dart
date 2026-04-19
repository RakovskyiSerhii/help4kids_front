import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/user.dart';
import 'package:help4kids_front/data/network/repository/user_repository.dart';
import 'package:help4kids_front/presentation/pages/profile/profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;

  ProfileCubit(this._userRepository) : super(ProfileState()) {
    loadProfile();
  }

  void loadProfile() {
    emit(state.copyWith(loadResult: Result.progress()));
    _userRepository.getProfile().then((value) {
      value.either(
        (error) => emit(state.copyWith(
          loadResult: Result.failure(error),
        )),
        (user) => emit(state.copyWith(
          user: user,
          loadResult: Result.success(),
        )),
      );
    });
  }

  bool isAdmin() {
    final user = state.user;
    if (user == null) return false;
    // TODO: Verify actual admin roleId value from backend
    // Common patterns: 'admin', 'ADMIN', '1', etc.
    return user.roleId.toLowerCase() == 'admin' || 
           user.roleId == '1' ||
           user.roleId.toLowerCase().contains('admin');
  }
}

