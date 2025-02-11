import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user.dart';

part 'user_create.freezed.dart';
part 'user_create.g.dart';

@riverpod
class UserCreateStateNotifier extends _$UserCreateStateNotifier {
  @override
  UserCreateState build() => const UserCreateState();

  void setProfile({
    required String firstName,
    required String lastName,
  }) {
    state = state.copyWith(
      firstName: firstName,
      lastName: lastName,
    );
  }

  void setPrivateInfo({
    required String address,
    required String phoneNumber,
  }) {
    state = state.copyWith(
      address: address,
      phoneNumber: phoneNumber,
    );
  }

  Future<void> create() async {
    await ref.read(userRepositoryProvider).createUser(
          firstName: state.firstName,
          lastName: state.lastName,
          address: state.address,
          phoneNumber: state.phoneNumber,
        );
    ref.invalidate(userProvider);
  }
}

@freezed
class UserCreateState with _$UserCreateState {
  const factory UserCreateState({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String address,
    @Default('') String phoneNumber,
  }) = _UserCreateState;
  const UserCreateState._();
}
