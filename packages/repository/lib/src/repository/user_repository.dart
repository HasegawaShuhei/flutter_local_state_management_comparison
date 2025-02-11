import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/user/user_dto.dart';
import '../dummy_data/user/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) => UserRepository(ref);

// 今回は簡易的に実装するため、providerで保持したデータを返却する
class UserRepository {
  UserRepository(this._ref);

  final Ref _ref;

  Future<UserDto?> fetcUser() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _ref.read(dummyUserDtoNotifierProvider);
  }

  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String address,
    required String phoneNumber,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    await _ref.read(dummyUserDtoNotifierProvider.notifier).create(
          firstName: firstName,
          lastName: lastName,
          address: address,
          phoneNumber: phoneNumber,
        );
  }
}
