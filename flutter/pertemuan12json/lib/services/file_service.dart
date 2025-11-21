import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FileService {
  // get app documents directory
  static Future<Directory> getAppDir() async {
    return await getApplicationDocumentsDirectory();
  }

  static Future<File> writeString(String filename, String content) async {
    final dir = await getAppDir();
    final file = File(p.join(dir.path, filename));
    return file.writeAsString(content);
  }

  static Future<String?> readString(String filename) async {
    try {
      final dir = await getAppDir();
      final file = File(p.join(dir.path, filename));
      if (await file.exists()) {
        return await file.readAsString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> deleteFile(String filename) async {
    try {
      final dir = await getAppDir();
      final file = File(p.join(dir.path, filename));
      if (await file.exists()) {
        await file.delete();
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
