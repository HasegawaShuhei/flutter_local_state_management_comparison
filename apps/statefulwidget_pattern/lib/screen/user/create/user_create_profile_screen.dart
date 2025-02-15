import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_create_private_info_screen.dart';

class UserCreateProfileScreen extends ConsumerStatefulWidget {
  const UserCreateProfileScreen({super.key});

  @override
  ConsumerState<UserCreateProfileScreen> createState() =>
      _UserCreateProfileScreenState();
}

class _UserCreateProfileScreenState
    extends ConsumerState<UserCreateProfileScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  Future<void> _onNextPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ref.read(userCreateStateNotifierProvider.notifier).setProfile(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        );

    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const UserCreatePrivateInfoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // prevent from disposing while creating user
    ref.listen(userCreateStateNotifierProvider, (_, __) {});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                validator: _nameValidator,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                validator: _nameValidator,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _onNextPressed,
                child: const Text('next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
