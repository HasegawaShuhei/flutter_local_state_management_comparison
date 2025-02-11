import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dto/task/task_dto.dart';

part 'task_repository.g.dart';

@riverpod
TaskRepository taskRepository(Ref ref) => TaskRepository(
    // ref.watch(apiClientProvider),
    );

class TaskRepository {
  // const TaskRepository(
  //   this._apiClient,
  // );

  // final ApiClient _apiClient;

  Future<TaskDto> fetchTask() async {
    final dammyData = {
      'id': 1,
      'title': 'title',
      'description': 'description',
      'isCompleted': false,
      'createdAt': DateTime.now().toIso8601String(),
    };
    return TaskDto.fromJson(dammyData);
  }
}
