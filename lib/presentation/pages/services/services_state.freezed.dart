// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServicesState {
  List<ServiceCategory>? get categories => throw _privateConstructorUsedError;
  List<Service>? get services => throw _privateConstructorUsedError;
  Result<dynamic>? get loadResult => throw _privateConstructorUsedError;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res, ServicesState>;
  @useResult
  $Res call(
      {List<ServiceCategory>? categories,
      List<Service>? services,
      Result<dynamic>? loadResult});

  $ResultCopyWith<dynamic, $Res>? get loadResult;
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res, $Val extends ServicesState>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? services = freezed,
    Object? loadResult = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategory>?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      loadResult: freezed == loadResult
          ? _value.loadResult
          : loadResult // ignore: cast_nullable_to_non_nullable
              as Result<dynamic>?,
    ) as $Val);
  }

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<dynamic, $Res>? get loadResult {
    if (_value.loadResult == null) {
      return null;
    }

    return $ResultCopyWith<dynamic, $Res>(_value.loadResult!, (value) {
      return _then(_value.copyWith(loadResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServicesStateImplCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$$ServicesStateImplCopyWith(
          _$ServicesStateImpl value, $Res Function(_$ServicesStateImpl) then) =
      __$$ServicesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServiceCategory>? categories,
      List<Service>? services,
      Result<dynamic>? loadResult});

  @override
  $ResultCopyWith<dynamic, $Res>? get loadResult;
}

/// @nodoc
class __$$ServicesStateImplCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res, _$ServicesStateImpl>
    implements _$$ServicesStateImplCopyWith<$Res> {
  __$$ServicesStateImplCopyWithImpl(
      _$ServicesStateImpl _value, $Res Function(_$ServicesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? services = freezed,
    Object? loadResult = freezed,
  }) {
    return _then(_$ServicesStateImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategory>?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      loadResult: freezed == loadResult
          ? _value.loadResult
          : loadResult // ignore: cast_nullable_to_non_nullable
              as Result<dynamic>?,
    ));
  }
}

/// @nodoc

class _$ServicesStateImpl implements _ServicesState {
  _$ServicesStateImpl(
      {final List<ServiceCategory>? categories,
      final List<Service>? services,
      this.loadResult})
      : _categories = categories,
        _services = services;

  final List<ServiceCategory>? _categories;
  @override
  List<ServiceCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Service>? _services;
  @override
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Result<dynamic>? loadResult;

  @override
  String toString() {
    return 'ServicesState(categories: $categories, services: $services, loadResult: $loadResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.loadResult, loadResult) ||
                other.loadResult == loadResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_services),
      loadResult);

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesStateImplCopyWith<_$ServicesStateImpl> get copyWith =>
      __$$ServicesStateImplCopyWithImpl<_$ServicesStateImpl>(this, _$identity);
}

abstract class _ServicesState implements ServicesState {
  factory _ServicesState(
      {final List<ServiceCategory>? categories,
      final List<Service>? services,
      final Result<dynamic>? loadResult}) = _$ServicesStateImpl;

  @override
  List<ServiceCategory>? get categories;
  @override
  List<Service>? get services;
  @override
  Result<dynamic>? get loadResult;

  /// Create a copy of ServicesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicesStateImplCopyWith<_$ServicesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
