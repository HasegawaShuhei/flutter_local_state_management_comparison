import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_notifier.g.dart';

@riverpod
class LoadingNotifier extends _$LoadingNotifier {
  @override
  bool build() => false;

  void startLoading() => state = true;

  void stopLoading() => state = false;
}
