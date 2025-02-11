import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/dto.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String firstName,
    required String lastName,
    required String address,
    required String phoneNumber,
  }) = _User;
  const User._();

  factory User.fromDto(UserDto dto) {
    return User(
      id: dto.id,
      firstName: dto.firstName,
      lastName: dto.lastName,
      address: dto.address,
      phoneNumber: dto.phoneNumber,
    );
  }
}
