import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'overlay_loading_wrapper.dart';

class ProviderListenableWrapper<T> extends ConsumerStatefulWidget {
  const ProviderListenableWrapper({
    super.key,
    required this.provider,
    required this.child,
  });

  final ProviderListenable<T> provider;
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProviderListenableWrapperState();
}

class _ProviderListenableWrapperState
    extends ConsumerState<ProviderListenableWrapper<dynamic>> {
  @override
  void didChangeDependencies() {
    OverlayLoadingInherited.of(context).startLoading();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.provider;
    ref.listen(
      provider,
      (_, next) {
        if (next is AsyncError) {
          OverlayLoadingInherited.of(context).stopLoading();
          final message = next.error.toString();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }
        if (next is AsyncData) {
          if (next.isLoading) {
            OverlayLoadingInherited.of(context).startLoading();
          } else {
            OverlayLoadingInherited.of(context).stopLoading();
          }
        }
      },
    );
    return widget.child;
  }
}
