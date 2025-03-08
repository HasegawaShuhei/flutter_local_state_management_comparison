import 'package:common_ui/common_ui.dart';
import 'package:domain/use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:util/util.dart';

class TaskCreateScreen extends ConsumerStatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  ConsumerState<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends ConsumerState<TaskCreateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  Future<void> _onCreate() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await ref.asyncLoading(
      () async {
        await ref.read(taskCreateUseCaseProvider).execute(
              title: _titleController.text,
              description: _descriptionController.text,
            );
        if (mounted) {
          context.showSnackBar('Task created successfully');
          Navigator.of(context).pop();
        }
      },
      onError: (e, __) => context.showSnackBar(e.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadableScaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: _titleValidator,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _onCreate,
                child: const Text('create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
