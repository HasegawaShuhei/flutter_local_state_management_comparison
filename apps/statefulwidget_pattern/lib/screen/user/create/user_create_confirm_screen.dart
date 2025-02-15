import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:util/util.dart';

class UserCreateConfirmScreen extends ConsumerWidget {
  const UserCreateConfirmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCreateState = ref.watch(userCreateStateNotifierProvider);
    final isConfirmationChecked = ValueNotifier(false);

    Future<void> _onCreateUser() async {
      if (!isConfirmationChecked.value) {
        context.showSnackBar('Please confirm the information above is correct');
        return;
      }
      await ref.asyncLoading(
        () async {
          await ref.read(userCreateStateNotifierProvider.notifier).create();
          if (context.mounted) {
            Navigator.popUntil(
              context,
              (route) => route.isFirst,
            );
            context.showSnackBar('User created');
          }
        },
        onError: (e, __) => context.showSnackBar(e.toString()),
      );
    }

    return LoadableScaffold(
      appBar: AppBar(
        title: const Text('User Create Confirm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${userCreateState.firstName} ${userCreateState.lastName}',
            ),
            const SizedBox(height: 8),
            Text('Address: ${userCreateState.address}'),
            const SizedBox(height: 8),
            Text('Phone Number: ${userCreateState.phoneNumber}'),
            const SizedBox(height: 8),
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: isConfirmationChecked,
                  builder: (_, isChecked, __) {
                    return Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        isConfirmationChecked.value = value!;
                      },
                    );
                  },
                ),
                const Text('I confirm the information above is correct'),
              ],
            ),
            Align(
              child: ElevatedButton(
                onPressed: _onCreateUser,
                child: const Text('Create User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
