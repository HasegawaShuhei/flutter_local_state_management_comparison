// ignore_for_file: lines_longer_than_80_chars

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dto/task/task_dto.dart';
import '../../dto/task/tasks_dto.dart';

part 'tasks.g.dart';

@Riverpod(keepAlive: true)
TasksDto dummyTasksDto(Ref ref) {
  final tasksDto = TasksDto(
    items: [
      TaskDto(
        id: 0,
        title: 'Complete Project Proposal',
        description:
            'Draft and submit the project proposal to the client for feedback.',
        isCompleted: true,
        createdAt: DateTime(2023, 8, 15),
      ),
      TaskDto(
        id: 1,
        title: 'Team Meeting',
        description:
            'Attend the weekly team meeting to discuss project progress and roadblocks.',
        isCompleted: false,
        createdAt: DateTime(2023, 8, 22),
      ),
      TaskDto(
        id: 2,
        title: 'Submit Expense Report',
        description:
            'Compile and submit the monthly expense report to the finance department.',
        isCompleted: false,
        createdAt: DateTime(2023, 8, 25),
      ),
      TaskDto(
        id: 3,
        title: 'Design Review',
        description:
            'Review the latest design mockups with the design team for revisions.',
        isCompleted: true,
        createdAt: DateTime(2023, 8, 28),
      ),
      TaskDto(
        id: 4,
        title: 'Client Presentation',
        description:
            'Prepare and present the quarterly sales report to the client.',
        isCompleted: false,
        createdAt: DateTime(2023, 9, 2),
      ),
      TaskDto(
        id: 5,
        title: 'Update Software',
        description:
            'Upgrade the system software to the latest version to ensure compliance.',
        isCompleted: true,
        createdAt: DateTime(2023, 9, 5),
      ),
      TaskDto(
        id: 6,
        title: 'Research Competitors',
        description:
            'Conduct market research and analysis on competitor strategies.',
        isCompleted: false,
        createdAt: DateTime(2023, 9, 10),
      ),
      TaskDto(
        id: 7,
        title: 'Host Webinar',
        description:
            'Organize and host a webinar on industry trends and new technologies.',
        isCompleted: false,
        createdAt: DateTime(2023, 9, 12),
      ),
      TaskDto(
        id: 8,
        title: 'Finalize Contract',
        description:
            'Review and finalize the contract with the new vendor for approval.',
        isCompleted: true,
        createdAt: DateTime(2023, 9, 15),
      ),
      TaskDto(
        id: 9,
        title: 'Performance Review',
        description: 'Complete the performance reviews for the team members.',
        isCompleted: false,
        createdAt: DateTime(2023, 9, 18),
      ),
    ],
  );
  return tasksDto;
}
