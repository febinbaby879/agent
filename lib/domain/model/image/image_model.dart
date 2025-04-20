import 'dart:io';
import 'package:dio/dio.dart' as dio;

class ImageModel {
  File? fileImage;
  String? base64;
  String? type;
  dio.MultipartFile? multipartFile;
  ImageModel({this.fileImage, this.base64, this.type, this.multipartFile});

  // Factory constructor to create an ImageModel instance from a map
  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      // fileImage cannot be directly restored from JSON, as it's a file.
      fileImage: map['fileImage'] != null ? File(map['fileImage']) : null,
      base64: map['base64'] as String?,
      type: map['type'] as String?,
    );
  }

  // Method to convert ImageModel instance to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      // fileImage is saved as a file path instead of the File object itself
      'fileImage': fileImage?.path,
      'base64': base64,
      'type': type,
    };
  }
}
