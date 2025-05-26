import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;

class ImageModel {
  File? fileImage; // For mobile
  Uint8List? webImage; // For web
  String? base64;
  String? type;
  dio.MultipartFile? multipartFile;

  ImageModel({
    this.fileImage,
    this.webImage,
    this.base64,
    this.type,
    this.multipartFile,
  });

  /// 🔹 Factory constructor to create an ImageModel from a map
  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      fileImage: map['fileImage'] != null ? File(map['fileImage']) : null,
      webImage: map['webImage'] != null
          ? Uint8List.fromList(List<int>.from(map['webImage']))
          : null,
      base64: map['base64'] as String?,
      type: map['type'] as String?,
      multipartFile: null, // MultipartFile can't be stored in JSON
    );
  }

  /// 🔹 Convert ImageModel to JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'fileImage': fileImage?.path, // Store file path (only for mobile)
      'webImage': webImage?.toList(), // Convert Uint8List to List<int> for JSON
      'base64': base64,
      'type': type,
    };
  }
}
