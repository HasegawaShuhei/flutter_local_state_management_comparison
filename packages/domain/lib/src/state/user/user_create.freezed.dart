// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserCreateState {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  /// Create a copy of UserCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCreateStateCopyWith<UserCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreateStateCopyWith<$Res> {
  factory $UserCreateStateCopyWith(
          UserCreateState value, $Res Function(UserCreateState) then) =
      _$UserCreateStateCopyWithImpl<$Res, UserCreateState>;
  @useResult
  $Res call(
      {String firstName, String lastName, String address, String phoneNumber});
}

/// @nodoc
class _$UserCreateStateCopyWithImpl<$Res, $Val extends UserCreateState>
    implements $UserCreateStateCopyWith<$Res> {
  _$UserCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCreateStateImplCopyWith<$Res>
    implements $UserCreateStateCopyWith<$Res> {
  factory _$$UserCreateStateImplCopyWith(_$UserCreateStateImpl value,
          $Res Function(_$UserCreateStateImpl) then) =
      __$$UserCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName, String lastName, String address, String phoneNumber});
}

/// @nodoc
class __$$UserCreateStateImplCopyWithImpl<$Res>
    extends _$UserCreateStateCopyWithImpl<$Res, _$UserCreateStateImpl>
    implements _$$UserCreateStateImplCopyWith<$Res> {
  __$$UserCreateStateImplCopyWithImpl(
      _$UserCreateStateImpl _value, $Res Function(_$UserCreateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? address = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$UserCreateStateImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserCreateStateImpl extends _UserCreateState {
  const _$UserCreateStateImpl(
      {this.firstName = '',
      this.lastName = '',
      this.address = '',
      this.phoneNumber = ''})
      : super._();

  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String phoneNumber;

  @override
  String toString() {
    return 'UserCreateState(firstName: $firstName, lastName: $lastName, address: $address, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCreateStateImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, address, phoneNumber);

  /// Create a copy of UserCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCreateStateImplCopyWith<_$UserCreateStateImpl> get copyWith =>
      __$$UserCreateStateImplCopyWithImpl<_$UserCreateStateImpl>(
          this, _$identity);
}

abstract class _UserCreateState extends UserCreateState {
  const factory _UserCreateState(
      {final String firstName,
      final String lastName,
      final String address,
      final String phoneNumber}) = _$UserCreateStateImpl;
  const _UserCreateState._() : super._();

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get address;
  @override
  String get phoneNumber;

  /// Create a copy of UserCreateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCreateStateImplCopyWith<_$UserCreateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
