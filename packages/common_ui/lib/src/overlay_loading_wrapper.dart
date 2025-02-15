import 'dart:async';

import 'package:flutter/material.dart';

// 試しにInheritedWidgetを使った例、使ってない
class OverlayLoadingWrapper extends StatefulWidget {
  const OverlayLoadingWrapper({super.key, required this.child});
  final Widget child;

  @override
  MyState createState() => MyState();
}

class MyState extends State<OverlayLoadingWrapper> {
  final isLoading = ValueNotifier(false);

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return OverlayLoadingInherited(
      isLoading: isLoading.value,
      startLoading: startLoading,
      stopLoading: stopLoading,
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.child,
          ),
          ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (_, value, __) {
              return Visibility(
                visible: value,
                child: const Positioned.fill(
                  child: SizedBox.expand(
                    child: ColoredBox(
                      color: Colors.black45,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OverlayLoadingInherited extends InheritedWidget {
  const OverlayLoadingInherited({
    super.key,
    required this.isLoading,
    required this.startLoading,
    required this.stopLoading,
    required super.child,
  });

  final bool isLoading;
  final void Function() startLoading;
  final void Function() stopLoading;

  @override
  bool updateShouldNotify(OverlayLoadingInherited oldWidget) {
    return isLoading != oldWidget.isLoading;
  }

  static OverlayLoadingInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<OverlayLoadingInherited>();
    assert(result != null, 'No OverlayLoadingInherited found in context');
    return result!;
  }
}

extension OverlayLoadingContext on BuildContext {
  void startLoading() {
    OverlayLoadingInherited.of(this).startLoading();
  }

  void stopLoading() {
    OverlayLoadingInherited.of(this).stopLoading();
  }

  Future<void> asyncLoading(
    Future<void> Function() callback, {
    FutureOr<void> Function(Object e, StackTrace st)? onError,
  }) async {
    startLoading();
    try {
      await callback();
    } on Exception catch (e) {
      if (onError != null) {
        onError(e, StackTrace.current);
      }
    } finally {
      stopLoading();
    }
  }
}
