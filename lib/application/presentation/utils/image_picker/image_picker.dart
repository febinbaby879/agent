import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:agent_dashboard/domain/model/image/image_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';

class FilePickerService {
  static Future<List<ImageModel?>> pickImage(
      {bool allowMultiple = true}) async {
    return filePick(allowedExtensions: [
      'png',
      'jpg',
      'jpeg',
      'webp',
      'bmp',
      'gif',
      'heic',
      'tiff',
    ], allowMultiple: allowMultiple);
  }

  /// pick file
  static Future<List<ImageModel?>> filePick({
    required List<String>? allowedExtensions,
    bool allowMultiple = true,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: allowedExtensions,
          allowMultiple: allowMultiple,
          withData: kIsWeb);

      if (result != null) {
        List<ImageModel?> imageModels = [];

        for (var file in result.files) {
          final extension = file.name.split(".").last.toLowerCase();

          //  Handle PDF files separately
          if (extension == "pdf") {
            final bytes = file.bytes!;
            String base64 = base64Encode(bytes);
            imageModels.add(ImageModel(
              webImage: bytes,
              base64: base64,
              type: extension,
              multipartFile:
                  MultipartFile.fromBytes(bytes, filename: file.name),
            ));
            continue;
          }

          //  Skip compression for PNG files
          if (extension == "png") {
            final bytes = file.bytes!;
            String base64 = base64Encode(bytes);

            imageModels.add(ImageModel(
              webImage: bytes,
              base64: base64,
              type: extension,
              multipartFile:
                  MultipartFile.fromBytes(bytes, filename: file.name),
            ));
            continue;
          }

          //  Compress Images (Mobile & Web)
          Uint8List? compressedBytes;
          if (kIsWeb) {
            compressedBytes = await compressImageWeb(file.bytes!);
          } else {
            compressedBytes = await compressImageMobile(File(file.path!));
          }

          if (compressedBytes != null) {
            String base64 = base64Encode(compressedBytes);
            imageModels.add(ImageModel(
              webImage: compressedBytes,
              base64: base64,
              type: extension,
              multipartFile:
                  MultipartFile.fromBytes(compressedBytes, filename: file.name),
            ));
          } else {
            log('Compression failed for ${file.name}');
          }
        }
        //log(imageModels[0]!.webImage.toString());
        return imageModels;
      }
      return [];
    } catch (e) {
      log('Error in filePick: $e');
      return [];
    }
  }

  /// Compress Image for Web (Using `image` Package)**
  static Future<Uint8List> compressImageWeb(Uint8List imageBytes) async {
    try {
      img.Image? image = img.decodeImage(imageBytes);
      if (image == null) return imageBytes;

      img.Image resized = img.copyResize(image, width: 800);
      List<int> compressedBytes = img.encodeJpg(resized, quality: 75);

      return Uint8List.fromList(compressedBytes);
    } catch (e) {
      log('Error in web image compression: $e');
      return imageBytes;
    }
  }

  /// Compress Image for Mobile (Using `flutter_image_compress`)**
  static Future<Uint8List?> compressImageMobile(File file) async {
    try {
      final directory = await getTemporaryDirectory();
      final compressedFilePath = '${directory.path}/${const Uuid().v4()}.jpg';

      File? compressedFile;
      int quality = 90;

      while (
          compressedFile == null || compressedFile.lengthSync() > 500 * 1024) {
        compressedFile = await FlutterImageCompress.compressAndGetFile(
            file.absolute.path, compressedFilePath,
            quality: quality) as File;
        quality -= 10;
        if (quality < 0) break;
      }

      return compressedFile.readAsBytes();
    } catch (e) {
      log('Error in mobile image compression: $e');
      return null;
    }
  }
}
