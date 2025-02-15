import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/loading_notifier.dart';

extension WidgetRefExtension on WidgetRef {
  void startLoading() {
    read(loadingNotifierProvider.notifier).startLoading();
  }

  void stopLoading() {
    read(loadingNotifierProvider.notifier).stopLoading();
  }

  Future<void> asyncLoading(
    Future<void> Function() callback, {
    FutureOr<void> Function(Object e, StackTrace st)? onError,
  }) async {
    startLoading();
    try {
      await callback();
    } on Exception catch (e) {
      onError?.call(e, StackTrace.current);
    } finally {
      stopLoading();
    }
  }
}
