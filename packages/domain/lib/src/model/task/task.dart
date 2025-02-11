import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repository/dto.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required int id,
    required String title,
    String? description,
    required bool isCompleted,
    required DateTime createdAt,
  }) = _Task;
  const Task._();

  factory Task.fromDto(TaskDto dto) {
    return Task(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      isCompleted: dto.isCompleted,
      createdAt: dto.createdAt,
    );
  }
}
