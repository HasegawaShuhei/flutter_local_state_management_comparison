import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen(this.id, {super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    return AsyncValueScaffold(
      provider: taskProvider(id),
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final task = ref.watch(taskProvider(id)).valueOrNull;
            return Text('Task Details: ${task?.title ?? ''}');
          },
        ),
      ),
      bodyBuilder: (task) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title),
              Text(task.description ?? ''),
              Row(
                children: [
                  const Text('Completed'),
                  Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      // TODO(any): 完了のトグル実装
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
