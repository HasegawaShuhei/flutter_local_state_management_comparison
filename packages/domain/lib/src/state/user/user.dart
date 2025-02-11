import 'package:repository/repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/user/user.dart';

part 'user.g.dart';

@riverpod
Future<User?> user(Ref ref) async {
  final repository = ref.watch(userRepositoryProvider);
  final dto = await repository.fetcUser();
  if (dto == null) {
    return null;
  }
  return User.fromDto(dto);
}
