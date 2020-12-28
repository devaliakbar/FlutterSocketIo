import 'package:flutter/material.dart';

class TrackContext {
  final GlobalKey key = new GlobalKey();

  BuildContext getCurrentContext() {
    return key.currentContext;
  }
}
