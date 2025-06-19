// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';

class HtmlToPdfView extends StatelessWidget {
  final String htmlContent;
  final String containerId;

  HtmlToPdfView(
      {super.key, required this.htmlContent, required this.containerId}) {
    // Register the view
    // Only register once
    if (kIsWeb) {
      // Register only once for web
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        containerId,
        (int viewId) {
          final element = html.DivElement()
            ..id = containerId
            ..setInnerHtml(
              htmlContent,
              treeSanitizer: html.NodeTreeSanitizer.trusted,
            );
          return element;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: containerId);
  }
}
