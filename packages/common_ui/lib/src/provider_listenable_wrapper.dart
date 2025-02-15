import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:util/util.dart';

class ProviderListenableWrapper<T> extends ConsumerStatefulWidget {
  const ProviderListenableWrapper({
    super.key,
    required this.provider,
    required this.child,
    this.showLoadingOnReload = false,
  });

  final ProviderListenable<T> provider;
  final Widget child;
  final bool showLoadingOnReload;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProviderListenableWrapperState();
}

class _ProviderListenableWrapperState
    extends ConsumerState<ProviderListenableWrapper<dynamic>> {
  // @override
  // void didChangeDependencies() {
  //   ref.startLoading();
  //   // OverlayLoadingInherited.of(context).startLoading();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = widget.provider;
    ref.listen(
      provider,
      (prev, next) {
        if (next is AsyncError) {
          ref.stopLoading();
          // OverlayLoadingInherited.of(context).stopLoading();
          final message = next.error.toString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }
        if (next is AsyncData) {
          if (next.isLoading && widget.showLoadingOnReload) {
            ref.startLoading();
            // OverlayLoadingInherited.of(context).startLoading();
          } else {
            ref.stopLoading();
            // OverlayLoadingInherited.of(context).stopLoading();
          }
        }
      },
    );
    return widget.child;
  }
}
