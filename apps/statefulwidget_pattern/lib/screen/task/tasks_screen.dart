import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user/user_details_screen.dart';
import 'task_create_screen.dart';
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

    Future<void> onTapFAB() async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => const TaskCreateScreen(),
        ),
      );
    }

    Future<void> onUserIcon() async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => const UserDetailsScreen(),
        ),
      );
    }

    return AsyncValueScaffold(
      provider: tasksProvider,
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: onUserIcon,
          ),
        ],
      ),
      bodyBuilder: (data) {
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
                onChanged: (value) {
                  // TODO(any): 完了のトグル実装
                },
              ),
            );
          },
        );
      },
      floatingActionButton: FloatingActionButton(
        onPressed: onTapFAB,
        child: const Icon(Icons.add),
      ),
    );
  }
}
