import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
class ShareService {
  final Dio _dio = Dio();

  Future<void> shareImage({
    required String imageUrl,
    String? text,
  }) async {
    try {
      final tempDir = await getTemporaryDirectory();

      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final filePath = '${tempDir.path}/$fileName';

      await _dio.download(imageUrl, filePath);

      await Share.shareXFiles(
        [XFile(filePath)],
        text: text ?? '',
      );
    } catch (e) {
      throw Exception('Error while sharing an image: $e');
    }
  }
}