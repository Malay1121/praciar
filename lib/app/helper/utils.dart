import 'all_imports.dart';

class Utils {
  static bool isLocal = Platform.isWindows || Platform.isMacOS;
  static WindowsNotification winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

  static Future<String> getLocalPath() async {
    return (await getApplicationSupportDirectory()).path;
  }
}
