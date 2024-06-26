import 'all_imports.dart';

class Utils {
  static bool isLocal = Platform.isWindows || Platform.isMacOS;

  static Future<String> getLocalPath() async {
    return (await getApplicationSupportDirectory()).path;
  }
}
