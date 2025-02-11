import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create/user_create_profile_screen.dart';

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onUserCraete() async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const UserCreateProfileScreen(),
        ),
      );
    }

    return ProviderListenableWrapper(
      provider: userProvider,
      child: Consumer(
        builder: (_, ref, ___) {
          final asyncUser = ref.watch(userProvider);
          return AsyncValueWrapper(
            asyncValue: asyncUser,
            builder: (data) {
              final user = data;
              if (user == null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No user found'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: onUserCraete,
                        child: const Text('create user'),
                      ),
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${'${user.firstName} ${user.lastName}'}'),
                    Text('Address: ${user.address}'),
                    Text('PhoneNumber: ${user.phoneNumber}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
