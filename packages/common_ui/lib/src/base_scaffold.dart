import 'package:flutter/material.dart';

import 'overlay_loading_wrapper.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.appBar,
    required this.body,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return OverlayLoadingWrapper(
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
