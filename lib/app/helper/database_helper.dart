import 'package:praciar/app/helper/local/database/local_get_project.dart';
import 'package:praciar/app/helper/local/database/local_get_workspace.dart';

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

  static Future<dynamic> getWorkspace({required String workspaceId}) async {
    if (Utils.isLocal) {
      return await localGetWorkspace(workspaceId: workspaceId);
    } else {
      return await localGetWorkspace(workspaceId: workspaceId);
    }
  }

  static Future<dynamic> getProject(
      {required String projectId, required String workspaceId}) async {
    if (Utils.isLocal) {
      return await localGetProject(
          projectId: projectId, workspaceId: workspaceId);
    } else {
      return await localGetProject(
          projectId: projectId, workspaceId: workspaceId);
    }
  }
}
