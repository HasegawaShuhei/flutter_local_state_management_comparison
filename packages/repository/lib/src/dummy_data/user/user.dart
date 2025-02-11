// ignore_for_file: lines_longer_than_80_chars

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dto/user/user_dto.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
class DummyUserDtoNotifier extends _$DummyUserDtoNotifier {
  @override
  UserDto? build() => null;

  Future<void> create({
    required String firstName,
    required String lastName,
    required String address,
    required String phoneNumber,
  }) async {
    final newUser = UserDto(
      id: 0,
      firstName: firstName,
      lastName: lastName,
      address: address,
      phoneNumber: phoneNumber,
    );
    state = newUser;
  }
}
