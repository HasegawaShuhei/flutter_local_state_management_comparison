import 'package:repository/repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../state/task/tasks.dart';

part 'task_create_use_case.g.dart';

@riverpod
TaskCreateUseCase taskCreateUseCase(Ref ref) => TaskCreateUseCase(ref);

class TaskCreateUseCase {
  const TaskCreateUseCase(this._ref);
  final Ref _ref;

  Future<void> execute({
    required String title,
    required String description,
  }) async {
    await _ref.read(taskRepositoryProvider).createTask(
          title: title,
          description: description,
        );
    _ref.invalidate(tasksProvider);
  }
}
