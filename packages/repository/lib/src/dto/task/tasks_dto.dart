import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_dto.dart';

part 'tasks_dto.freezed.dart';
part 'tasks_dto.g.dart';

@freezed
class TasksDto with _$TasksDto {
  const factory TasksDto({
    @Default([]) List<TaskDto> items,
  }) = _TasksDto;
  const TasksDto._();

  factory TasksDto.fromJson(Map<String, dynamic> json) =>
      _$TasksDtoFromJson(json);
}
