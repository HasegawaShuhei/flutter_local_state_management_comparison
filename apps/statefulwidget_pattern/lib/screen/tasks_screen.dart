import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task_details_screen.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onTapTask(int id) async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => TaskDetailsScreen(id),
        ),
      );
    }

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ProviderListenableWrapper(
        provider: tasksProvider,
        child: Consumer(
          builder: (_, ref, ___) {
            final asyncTasks = ref.watch(tasksProvider);
            return AsyncValueWrapper(
              asyncValue: asyncTasks,
              builder: (data) {
                return ListView.separated(
                  itemCount: data.items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final task = data.items[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description ?? ''),
                      onTap: () async => onTapTask(task.id),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {},
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
