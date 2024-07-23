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

  static Future<dynamic> getTags() async {
    if (Utils.isLocal) {
      return await localGetTags();
    } else {
      return await localGetTags();
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

  static Future<dynamic> createTag({required Map data}) async {
    List tags = (await localReadData())["tags"];
    List idList = [];
    for (Map tag in tags) {
      idList.add(tag["id"]);
    }
    String id = Utils.nameToId(data["name"], idList);
    data.addEntries({
      "id": id,
    }.entries);
    if (Utils.isLocal) {
      return await localCreateTag(data);
    } else {
      return await localCreateTag(data);
    }
  }

  static Future<dynamic> updateTag({required Map data}) async {
    if (Utils.isLocal) {
      return await localUpdateTag(data);
    } else {
      return await localUpdateTag(data);
    }
  }

  static Future<dynamic> deleteTag({required String id}) async {
    if (Utils.isLocal) {
      return await localDeleteTag(id);
    } else {
      return await localDeleteTag(id);
    }
  }
}
