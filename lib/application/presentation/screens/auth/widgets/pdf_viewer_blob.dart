import 'dart:html' as html;
import 'dart:ui_web' as ui_web; // For Flutter web platform views
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class WebPdfViewer extends StatelessWidget {
  final Uint8List pdfBytes;

  const WebPdfViewer({super.key, required this.pdfBytes});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const Text("Only works on web");

    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final viewType = 'pdf-viewer-${url.hashCode}';

    ui_web.platformViewRegistry.registerViewFactory(
      viewType,
      (int _) => html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%',
    );

    return SizedBox(
      height: 600,
      child: HtmlElementView(viewType: viewType),
    );
  }
}
