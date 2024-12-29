import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class SaveImageHelper {
  static Future<bool> downloadAndSaveImage(
      {required Response response, required String fileName}) async {
    try {
      // Get the temporary directory of the device
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Download the image

      if (response.data == null || response.statusCode != 200) {
        return false;
      }
      // Save the image to the temporary directory
      File file = File('$tempPath/$fileName');
      await file.writeAsBytes(response.data);

      // Move the file to the permanent storage
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final File newImage = await file.copy('$appDocPath/$fileName');

      print('Image saved to: ${newImage.path}');
      return true;
    } catch (e) {
      print('Error downloading or saving image: $e');
      return false;
    }
  }
}
