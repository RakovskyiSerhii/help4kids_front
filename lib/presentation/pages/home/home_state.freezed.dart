// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  Result<dynamic>? get loadingResult => throw _privateConstructorUsedError;
  LandingResponse? get landing => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({Result<dynamic>? loadingResult, LandingResponse? landing});

  $ResultCopyWith<dynamic, $Res>? get loadingResult;
  $LandingResponseCopyWith<$Res>? get landing;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingResult = freezed,
    Object? landing = freezed,
  }) {
    return _then(_value.copyWith(
      loadingResult: freezed == loadingResult
          ? _value.loadingResult
          : loadingResult // ignore: cast_nullable_to_non_nullable
              as Result<dynamic>?,
      landing: freezed == landing
          ? _value.landing
          : landing // ignore: cast_nullable_to_non_nullable
              as LandingResponse?,
    ) as $Val);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<dynamic, $Res>? get loadingResult {
    if (_value.loadingResult == null) {
      return null;
    }

    return $ResultCopyWith<dynamic, $Res>(_value.loadingResult!, (value) {
      return _then(_value.copyWith(loadingResult: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LandingResponseCopyWith<$Res>? get landing {
    if (_value.landing == null) {
      return null;
    }

    return $LandingResponseCopyWith<$Res>(_value.landing!, (value) {
      return _then(_value.copyWith(landing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<dynamic>? loadingResult, LandingResponse? landing});

  @override
  $ResultCopyWith<dynamic, $Res>? get loadingResult;
  @override
  $LandingResponseCopyWith<$Res>? get landing;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingResult = freezed,
    Object? landing = freezed,
  }) {
    return _then(_$HomeStateImpl(
      loadingResult: freezed == loadingResult
          ? _value.loadingResult
          : loadingResult // ignore: cast_nullable_to_non_nullable
              as Result<dynamic>?,
      landing: freezed == landing
          ? _value.landing
          : landing // ignore: cast_nullable_to_non_nullable
              as LandingResponse?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl({this.loadingResult, this.landing});

  @override
  final Result<dynamic>? loadingResult;
  @override
  final LandingResponse? landing;

  @override
  String toString() {
    return 'HomeState(loadingResult: $loadingResult, landing: $landing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.loadingResult, loadingResult) ||
                other.loadingResult == loadingResult) &&
            (identical(other.landing, landing) || other.landing == landing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingResult, landing);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final Result<dynamic>? loadingResult,
      final LandingResponse? landing}) = _$HomeStateImpl;

  @override
  Result<dynamic>? get loadingResult;
  @override
  LandingResponse? get landing;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
