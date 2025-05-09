import 'dart:async';
import 'dart:typed_data';
import 'dart:io';

import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';

class FilePickerHelper {
  static Future<List<Uint8List?>> pickPdfWeb() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withReadStream: true, // Only use this on web
      );

      if (result != null) {
        final stream = result.files.single.readStream;
        if (stream != null) {
          final completer = Completer<Uint8List>();
          final chunks = <int>[];

          stream.listen(
            (data) => chunks.addAll(data),
            onDone: () => completer.complete(Uint8List.fromList(chunks)),
            onError: (e) => completer.completeError(e),
          );

          return [await completer.future];
        }
      }

      return [];
    } catch (e, stack) {
      print("PDF picking failed: $e\n$stack");
      return [];
    }
  }

  static Future<List<Uint8List?>> pickFiles({
    List<String>? allowedExtensions,
    FileType? fileType,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowedExtensions: allowedExtensions,
        type: allowedExtensions != null
            ? FileType.custom
            : fileType ?? FileType.any,
        allowMultiple: false,
        withData: true,
        withReadStream: true,
      );

      if (result == null) return [];

      return await Future.wait(result.files.map((e) async {
        if (e.bytes != null) return e.bytes;

        // Fallback to reading via readStream
        if (e.readStream != null) {
          final stream = e.readStream!;
          final chunks = <int>[];
          await for (var chunk in stream) {
            chunks.addAll(chunk);
          }
          return Uint8List.fromList(chunks);
        }

        // If all fails, return null
        return null;
      }));
    } catch (e) {
      print('pickPdf error: $e');
      return [];
    }
  }
}
