import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dto/task/task_dto.dart';
import 'tasks.dart';

part 'task.g.dart';

@Riverpod(keepAlive: true)
TaskDto dummyTaskDto(Ref ref, int id) {
  final tasks = ref.watch(dummyTasksDtoProvider).items;
  return tasks.firstWhere((task) => task.id == id);
}
