import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  const factory TaskDto({
    required int id,
    required String title,
    String? description,
    required bool isCompleted,
    required DateTime createdAt,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
}
