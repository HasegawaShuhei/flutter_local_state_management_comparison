import 'package:repository/repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/task/tasks.dart';

part 'tasks.g.dart';

@riverpod
Future<Tasks> task(Ref ref) async {
  final repository = ref.watch(taskRepositoryProvider);
  final dto = await repository.fetchTasks();
  return Tasks.fromDto(dto);
}
