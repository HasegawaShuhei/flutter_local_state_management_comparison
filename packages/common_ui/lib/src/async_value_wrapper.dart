import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        errorBuilder?.call(error, stackTrace) ?? const SizedBox.shrink(),
      AsyncLoading() => loadingWidget ?? const SizedBox.shrink(),
      _ => const SizedBox.shrink(),
    };
  }
}
