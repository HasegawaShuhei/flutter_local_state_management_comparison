import 'package:domain/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _Body extends ConsumerStatefulWidget {
  const _Body();

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _addressController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  String? _addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _phoneNumberValidator(String? value) {
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

  Future<void> _onNextPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ref.read(createUserStateNotifierProvider.notifier).setPrivateInfo(
          address: _addressController.text,
          phoneNumber: _phoneNumberController.text,
        );

    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const UserCreateConfirmScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _addressController,
              validator: _addressValidator,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneNumberController,
              validator: _phoneNumberValidator,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
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
    );
  }
}
