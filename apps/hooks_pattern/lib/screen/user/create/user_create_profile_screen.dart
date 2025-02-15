import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_create_private_info_screen.dart';

class UserCreateProfileScreen extends HookConsumerWidget {
  const UserCreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // prevent from disposing while creating user
    ref.listen(userCreateStateNotifierProvider, (_, __) {});

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();

    String? nameValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    Future<void> onNextPressed() async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      ref.read(userCreateStateNotifierProvider.notifier).setProfile(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
          );

      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const UserCreatePrivateInfoScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: firstNameController,
                validator: nameValidator,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: lastNameController,
                validator: nameValidator,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onNextPressed,
                child: const Text('next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
