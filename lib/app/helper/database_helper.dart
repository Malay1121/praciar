import 'all_imports.dart';

class DatabaseHelper {
  static void createDatabase() {
    if (Utils.isLocal) {
      localCreateDatabase();
    } else {}
  }
}
