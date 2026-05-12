import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehmon/core/constants/api_constants.dart';
import 'package:mehmon/core/networking/dio_client.dart';

/// Uploads images to the backend via `POST /api/upload` and returns the
/// public URL of the stored asset.
class ImageUploadService {
  const ImageUploadService(this._dio);

  final Dio _dio;

  Future<String> uploadImage(XFile file) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        file.path,
        filename: file.name,
        contentType: DioMediaType.parse(_mimeType(file.name)),
      ),
    });

    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.upload,
      data: formData,
    );

    final url = response.data?['url'];
    if (url is! String || url.isEmpty) {
      throw const FormatException('Upload response missing url field');
    }
    return url;
  }

  static String _mimeType(String filename) {
    final ext = filename.split('.').last.toLowerCase();
    const map = <String, String>{
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      'webp': 'image/webp',
    };
    return map[ext] ?? 'image/jpeg';
  }
}

final imageUploadServiceProvider = Provider<ImageUploadService>(
  (ref) => ImageUploadService(ref.read(dioClientProvider)),
);
