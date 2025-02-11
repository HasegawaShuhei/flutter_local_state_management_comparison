import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskDetailsScreen extends ConsumerWidget {
  const TaskDetailsScreen(this.id, {super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: ProviderListenableWrapper(
        provider: taskProvider(id),
        child: Consumer(
          builder: (_, ref, ___) {
            final asyncTask = ref.watch(taskProvider(id));
            return AsyncValueWrapper(
              asyncValue: asyncTask,
              builder: (data) {
                final task = data;
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
          },
        ),
      ),
    );
  }
}
