import 'package:common_ui/common_ui.dart';
import 'package:domain/state.dart';
import 'package:flutter/material.dart';

import 'create/user_create_profile_screen.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onTapUserCreate() async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const UserCreateProfileScreen(),
        ),
      );
    }

    return AsyncValueScaffold(
      provider: userProvider,
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      bodyBuilder: (data) {
        final user = data;
        if (user == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No user found'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onTapUserCreate,
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
  }
}
