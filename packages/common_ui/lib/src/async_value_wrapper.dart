import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 全体ローディングが基本のプロジェクトなので使ってないが、bodyだけローディングの場合はこれでいい
class AsyncValueWrapper<T> extends ConsumerWidget {
  const AsyncValueWrapper({
    super.key,
    required this.asyncValue,
    required this.builder,
    this.errorBuilder,
    this.loadingWidget,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T value) builder;
  final Widget Function(Object e, StackTrace st)? errorBuilder;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (asyncValue) {
      AsyncData(:final value) => builder(value),
      AsyncError(:final error, :final stackTrace) =>
        errorBuilder?.call(error, stackTrace) ??
            Center(child: Text(error.toString())),
      AsyncLoading() =>
        loadingWidget ?? const Center(child: CircularProgressIndicator()),
      _ => const SizedBox.shrink(),
    };
  }
}
