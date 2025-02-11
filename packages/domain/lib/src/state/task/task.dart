import 'package:repository/repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/task/task.dart';

part 'task.g.dart';

@riverpod
Future<Task> task(Ref ref, int id) async {
  final repository = ref.watch(taskRepositoryProvider);
  final dto = await repository.fetchTask(id);
  return Task.fromDto(dto);
}
