import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String firstName,
    required String lastName,
    required String address,
    required String phoneNumber,
  }) = _UserDto;
  const UserDto._();
}
