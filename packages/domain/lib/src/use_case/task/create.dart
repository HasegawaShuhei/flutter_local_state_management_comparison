import 'package:repository/repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../state/task/tasks.dart';

part 'create.g.dart';

@riverpod
CreateTaskUseCase createTaskUseCase(Ref ref) => CreateTaskUseCase(ref);

class CreateTaskUseCase {
  const CreateTaskUseCase(this._ref);
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
