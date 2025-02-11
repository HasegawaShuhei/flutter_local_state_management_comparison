import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/dto.dart';

import 'task.dart';

part 'tasks.freezed.dart';

@freezed
class Tasks with _$Tasks {
  const factory Tasks({
    @Default([]) List<Task> items,
  }) = _Tasks;
  const Tasks._();

  factory Tasks.fromDto(TasksDto dto) =>
      Tasks(items: dto.items.map(Task.fromDto).toList());
}
