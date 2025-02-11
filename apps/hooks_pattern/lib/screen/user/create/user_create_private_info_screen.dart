import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'user_create_confirm_screen.dart';

class UserCreatePrivateInfoScreen extends StatelessWidget {
  const UserCreatePrivateInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Private Info'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final addressController = useTextEditingController();
    final phoneNumberController = useTextEditingController();

    String? addressValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    String? phoneNumberValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      if (value.length < 10) {
        return 'Please enter a valid phone number';
      }
      if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
      return null;
    }

    Future<void> onNextPressed() async {
      if (!formKey.currentState!.validate()) {
        return;
      }
      ref.read(userCreateStateNotifierProvider.notifier).setPrivateInfo(
            address: addressController.text,
            phoneNumber: phoneNumberController.text,
          );

      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const UserCreateConfirmScreen(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: addressController,
              validator: addressValidator,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phoneNumberController,
              validator: phoneNumberValidator,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
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
    );
  }
}
