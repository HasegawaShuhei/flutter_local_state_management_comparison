import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:util/util.dart';

class UserCreateConfirmScreen extends StatelessWidget {
  const UserCreateConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('User Create Confirm'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCreateState = ref.watch(userCreateStateNotifierProvider);
    final isConfirmationCheckedValueNotifier = useValueNotifier(false);

    Future<void> _onCreateUser() async {
      if (!isConfirmationCheckedValueNotifier.value) {
        context.showSnackBar('Please confirm the information above is correct');
        return;
      }
      await context.asyncLoading(
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

    return Padding(
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
              HookBuilder(
                builder: (_) {
                  final isConfirmationChecked =
                      useValueListenable(isConfirmationCheckedValueNotifier);
                  return Checkbox(
                    value: isConfirmationChecked,
                    onChanged: (value) {
                      isConfirmationCheckedValueNotifier.value = value!;
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
    );
  }
}
