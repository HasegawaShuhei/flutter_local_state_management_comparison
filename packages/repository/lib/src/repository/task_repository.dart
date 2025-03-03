import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/task/task_dto.dart';
import '../dto/task/tasks_dto.dart';
import '../dummy_data/task/task.dart';
import '../dummy_data/task/tasks.dart';

part 'task_repository.g.dart';

@riverpod
TaskRepository taskRepository(Ref ref) => TaskRepository(ref);

// 今回は簡易的に実装するため、providerで保持したデータを返却する
class TaskRepository {
  TaskRepository(this._ref);

  final Ref _ref;

  Future<TasksDto> fetchTasks() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _ref.read(dummyTasksDtoNotifierProvider);
  }

  Future<TaskDto> fetchTask(int id) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _ref.read(dummyTaskDtoProvider(id));
  }

  Future<void> createTask({
    required String title,
    required String description,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    await _ref.read(dummyTasksDtoNotifierProvider.notifier).create(
          title: title,
          description: description,
        );
  }
}
