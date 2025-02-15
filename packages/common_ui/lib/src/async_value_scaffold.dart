import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:util/util.dart';

/// AsyncValueの初期表示で全体ローディングしたい際に使うScaffold
class AsyncValueScaffold<T> extends ConsumerWidget {
  const AsyncValueScaffold({
    super.key,
    this.appBar,
    required this.bodyBuilder,
    this.errorBuilder,
    this.loadingWidget,
    this.floatingActionButton,
    required this.provider,
    this.needsLoadingOnRefresh = false,
    this.needsLoadingOnReload = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget Function(T value) bodyBuilder;
  final Widget Function(Object e, StackTrace st)? errorBuilder;
  final Widget? loadingWidget;
  final Widget? floatingActionButton;
  final ProviderBase<AsyncValue<T>> provider;
  final bool needsLoadingOnRefresh;
  final bool needsLoadingOnReload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      provider,
      (prev, next) {
        if (next is AsyncError) {
          ref.stopLoading();
          final message = next.error.toString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }
        if (next is AsyncData) {
          ref.stopLoading();
        }
      },
    );
    return Stack(
      children: [
        Positioned.fill(
          child: Scaffold(
            appBar: appBar,
            body: Consumer(
              builder: (_, ref, __) {
                final asyncValue = ref.watch(provider);
                return switch (asyncValue) {
                  AsyncData(:final value) => bodyBuilder(value),
                  // このプロジェクトではエラーはsnackbarで表示するので、基本は表示しない
                  AsyncError(:final error, :final stackTrace) =>
                    errorBuilder?.call(error, stackTrace) ??
                        const SizedBox.shrink(),
                  // このプロジェクトではローディングは全体表示にしたいので、基本は表示しない
                  AsyncLoading() => loadingWidget ?? const SizedBox.shrink(),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
            floatingActionButton: floatingActionButton,
          ),
        ),
        Positioned.fill(
          child: Consumer(
            builder: (context, ref, _) {
              final asyncValue = ref.watch(provider);
              if (asyncValue is! AsyncLoading) {
                return const SizedBox.shrink();
              }
              // isReloading → watch
              if (asyncValue case AsyncLoading(:final isReloading)
                  when isReloading && needsLoadingOnReload) {
                return const _OverlayLoadingIndicator();
              }
              // isRefreshing → invalidate, refresh
              if (asyncValue case AsyncLoading(:final isRefreshing)
                  when isRefreshing && needsLoadingOnRefresh) {
                ref.startLoading();
                return const _OverlayLoadingIndicator();
              }
              return const _OverlayLoadingIndicator();
            },
          ),
        ),
      ],
    );
  }
}

class _OverlayLoadingIndicator extends ConsumerWidget {
  const _OverlayLoadingIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox.expand(
      child: ColoredBox(
        color: Colors.black45,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
