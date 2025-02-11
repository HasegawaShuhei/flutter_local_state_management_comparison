import 'package:common_ui/common_ui.dart';
import 'package:domain/use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:util/util.dart';

// [参考](https://tech.layerx.co.jp/entry/2023/12/06/163409)
typedef _TaskCreateScreenState = ({
  TextEditingController titleController,
  TextEditingController descriptionController,
  GlobalKey<FormState> formKey,
});

typedef _TaskCreateScreenAction = ({
  String? Function(String?) titleValidator,
  void Function() onCreate,
});

({
  _TaskCreateScreenState state,
  _TaskCreateScreenAction action,
}) _useTaskCreateScreen() {
  final context = useContext();
  final ref = useContext() as WidgetRef;
  final formKey = useMemoized(GlobalKey<FormState>.new);
  final titleController = useTextEditingController();
  final descriptionController = useTextEditingController();

  useEffect(
    () {
      print('init');
      return () {
        print('disposed');
      };
    },
    [],
  );

  // ignore: avoid_types_on_closure_parameters
  final titleValidator = useCallback((String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  });

  final onCreate = useCallback(() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.asyncLoading(
      () async {
        await ref.read(taskCreateUseCaseProvider).execute(
              title: titleController.text,
              description: descriptionController.text,
            );
        if (context.mounted) {
          context.showSnackBar('Task created successfully');
          Navigator.of(context).pop();
        }
      },
      onError: (e, __) => context.showSnackBar(e.toString()),
    );
  });

  return (
    state: (
      titleController: titleController,
      descriptionController: descriptionController,
      formKey: formKey,
    ),
    action: (
      onCreate: onCreate,
      titleValidator: titleValidator,
    ),
  );
}

class TaskCreateScreen extends StatelessWidget {
  const TaskCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (:state, :action) = _useTaskCreateScreen();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: state.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: state.titleController,
              validator: action.titleValidator,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: state.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: action.onCreate,
              child: const Text('create'),
            ),
          ],
        ),
      ),
    );
  }
}
