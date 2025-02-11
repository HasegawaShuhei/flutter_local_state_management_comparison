import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user.dart';

part 'create_user.freezed.dart';
part 'create_user.g.dart';

@riverpod
class CreateUserStateNotifier extends _$CreateUserStateNotifier {
  @override
  CreateUserState build() => const CreateUserState();

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

  Future<void> createUser() async {
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
class CreateUserState with _$CreateUserState {
  const factory CreateUserState({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String address,
    @Default('') String phoneNumber,
  }) = _CreateUserState;
  const CreateUserState._();
}
