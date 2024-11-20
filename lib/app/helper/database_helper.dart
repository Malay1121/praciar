import 'package:praciar/app/helper/local/database/update/local_update_project.dart';

import 'all_imports.dart';
import 'local/database/get/local_get_pinned_projects.dart';

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

  static Future<List> getWorkspace({String? workspaceId}) async {
    if (Utils.isLocal) {
      return await localGetWorkspace(workspaceId: workspaceId);
    } else {
      return await localGetWorkspace(workspaceId: workspaceId);
    }
  }

  static Future<List> getProject(
      {String? projectId, String? workspaceId}) async {
    if (Utils.isLocal) {
      return await localGetProject(
          projectId: projectId, workspaceId: workspaceId);
    } else {
      return await localGetProject(
          projectId: projectId, workspaceId: workspaceId);
    }
  }

  static Future<List> getPinnedProject() async {
    if (Utils.isLocal) {
      return await localGetPinnedProject();
    } else {
      return await localGetPinnedProject();
    }
  }

  static Future<List> getTaskList(
      {String? projectId, String? workspaceId, String? taskListId}) async {
    if (Utils.isLocal) {
      return await localGetTaskList(
          projectId: projectId,
          workspaceId: workspaceId,
          taskListId: taskListId);
    } else {
      return await localGetTaskList(
          projectId: projectId,
          workspaceId: workspaceId,
          taskListId: taskListId);
    }
  }

  static Future<List> getTask(
      {String? projectId,
      String? workspaceId,
      String? taskListId,
      String? taskId}) async {
    if (Utils.isLocal) {
      return await localGetTask(
          projectId: projectId,
          workspaceId: workspaceId,
          taskListId: taskListId,
          taskId: taskId);
    } else {
      return await localGetTask(
          projectId: projectId,
          workspaceId: workspaceId,
          taskListId: taskListId,
          taskId: taskId);
    }
  }

  static Future<List> getSubTask(
      {String? projectId,
      String? workspaceId,
      String? taskListId,
      String? taskId,
      String? subTaskId}) async {
    if (Utils.isLocal) {
      return await localGetSubTask(
          projectId: projectId,
          workspaceId: workspaceId,
          taskListId: taskListId,
          taskId: taskId,
          subTaskId: subTaskId);
    } else {
      return await localGetSubTask(
          projectId: projectId,
          workspaceId: workspaceId,
          taskListId: taskListId,
          taskId: taskId,
          subTaskId: subTaskId);
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

  static Future<dynamic> updateProject(
      {required String projectId, required Map projectData}) async {
    if (Utils.isLocal) {
      return await localUpdateProject(
          projectId: projectId, projectData: projectData);
    } else {
      return await localUpdateProject(
          projectId: projectId, projectData: projectData);
    }
  }

  static Future<dynamic> deleteTag({required String id}) async {
    if (Utils.isLocal) {
      return await localDeleteTag(id);
    } else {
      return await localDeleteTag(id);
    }
  }

  static Future<dynamic> createUser(
      {required String name,
      required String email,
      required String role}) async {
    if (Utils.isLocal) {
      return await localCreateUser(name: name, email: email, role: role);
    } else {
      return await localCreateUser(name: name, email: email, role: role);
    }
  }

  static Future<dynamic> getUsers() async {
    if (Utils.isLocal) {
      return await localGetUsers();
    } else {
      return await localGetUsers();
    }
  }

  static Future<Map> updateSettings(
      {required String category,
      required String parameter,
      required Map newValue}) async {
    if (Utils.isLocal) {
      return await localUpdateSettings(
          category: category, parameter: parameter, newValue: newValue);
    } else {
      return await localUpdateSettings(
          category: category, parameter: parameter, newValue: newValue);
    }
  }
}
