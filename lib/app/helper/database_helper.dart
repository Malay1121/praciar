import 'package:praciar/app/helper/local/database/local_get_project.dart';

import 'all_imports.dart';

class DatabaseHelper {
  static void createDatabase() {
    if (Utils.isLocal) {
      localCreateDatabase();
    } else {}
  }

  static Future<dynamic> getKey({required List location}) async {
    if (Utils.isLocal) {
      return await localGetKey(location: location);
    } else {
      return localGetKey(location: location);
    }
  }

  static Future<dynamic> getProject({required String project}) async {
    if (Utils.isLocal) {
      return await localGetProject(project);
    } else {
      return await localGetProject(project);
    }
  }
}
