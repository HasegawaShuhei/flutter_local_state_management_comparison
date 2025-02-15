import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:util/util.dart';

class LoadableScaffold extends StatelessWidget {
  const LoadableScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Scaffold(
            appBar: appBar,
            body: body,
            floatingActionButton: floatingActionButton,
          ),
        ),
        Positioned.fill(
          child: Consumer(
            builder: (context, ref, _) {
              final loading = ref.watch(loadingNotifierProvider);
              if (!loading) {
                return const SizedBox.shrink();
              }
              return const SizedBox.expand(
                child: ColoredBox(
                  color: Colors.black45,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            },
          ),
        ),
      ],
    );
    // return OverlayLoadingWrapper(
    //   child: Scaffold(
    //     appBar: appBar,
    //     body: body,
    //     floatingActionButton: floatingActionButton,
    //   ),
    // );
  }
}
