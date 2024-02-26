import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/color_resources.dart';

class DefaultScaffold extends StatelessWidget {
  DefaultScaffold({
    required this.child,
    this.appBar,
    this.extendBody = false
  });

  AppBar? appBar;
  Widget child;
  bool extendBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBody: extendBody,
      body: InkWell(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
        overlayColor: ColorResources.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
