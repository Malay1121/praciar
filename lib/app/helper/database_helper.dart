import 'package:praciar/app/helper/local/database/create/local_create_project.dart';
import 'package:praciar/app/helper/local/database/delete/local_delete_task_list.dart';
import 'package:praciar/app/helper/local/database/update/local_update_project.dart';
import 'package:praciar/app/helper/local/database/update/local_update_task.dart';
import 'package:praciar/app/helper/local/database/create/local_create_activity_log.dart';
import 'package:praciar/app/helper/local/database/get/local_get_activity_logs.dart';

import 'all_imports.dart';
import 'local/database/get/local_get_pinned_projects.dart';

class DatabaseHelper {
  static Future createDatabase() async {
    if (Utils.isLocal) {
      await localCreateDatabase();
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

  static Future<dynamic> getTaskTags(
      {required String workspaceId,
      required String projectId,
      String? tagId}) async {
    if (Utils.isLocal) {
      return await localGetTaskTags(
          workspaceId: workspaceId, projectId: projectId, tagId: tagId);
    } else {
      return await localGetTaskTags(
          workspaceId: workspaceId, projectId: projectId, tagId: tagId);
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

  static Future<List> getPinnedProject({String? workspaceId}) async {
    if (Utils.isLocal) {
      return await localGetPinnedProject(workspaceId: workspaceId);
    } else {
      return await localGetPinnedProject(workspaceId: workspaceId);
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

  static Future<dynamic> createTaskTag(
      {required String projectId,
      required String workspaceId,
      required Map data}) async {
    print("      projectId: ${projectId}, workspaceId: ${workspaceId},");
    List tags = Utils.getKey(
        (await localGetProject(
          projectId: projectId,
          workspaceId: workspaceId,
        ))
            .first,
        ["tags"],
        []);
    List idList = [];
    for (Map tag in tags) {
      idList.add(tag["id"]);
    }
    String id = Utils.nameToId(data["name"], idList);
    data.addEntries({
      "id": id,
    }.entries);
    if (Utils.isLocal) {
      return await localCreateTaskTag(workspaceId, projectId, data);
    } else {
      return await localCreateTaskTag(workspaceId, projectId, data);
    }
  }

  static Future<dynamic> createTask(
      {required String projectId,
      required String workspaceId,
      required String listId,
      required Map data}) async {
    print("      projectId: ${projectId}, workspaceId: ${workspaceId},");
    List tags =
        await localGetTask(workspaceId: workspaceId, projectId: projectId);
    List idList = [];
    for (Map tag in tags) {
      idList.add(tag["id"]);
    }
    String id = Utils.nameToId(Utils.getKey(data, ["title"], "task"), idList);
    data.addEntries({
      "id": id,
    }.entries);
    Utils.scheduleNotification(
      data,
      Utils.fromUtc(
        Utils.getKey(data, ["due_date"], Utils.toUtc(DateTime.now())),
      ),
    );
    if (Utils.isLocal) {
      return await localCreateTask(workspaceId, projectId, listId, data);
    } else {
      return await localCreateTask(workspaceId, projectId, listId, data);
    }
  }

  static Future<dynamic> createTaskList(
      {required String projectId,
      required String workspaceId,
      required Map data}) async {
    List tags =
        await localGetTaskList(workspaceId: workspaceId, projectId: projectId);
    List idList = [];
    for (Map tag in tags) {
      idList.add(tag["id"]);
    }
    String id =
        Utils.nameToId(Utils.getKey(data, ["name"], "tasklist"), idList);
    data.addEntries({
      "id": id,
      "tasks": [],
    }.entries);
    if (Utils.isLocal) {
      return await localCreateTaskList(workspaceId, projectId, data);
    } else {
      return await localCreateTaskList(workspaceId, projectId, data);
    }
  }

  static Future<dynamic> updateTag({required Map data}) async {
    if (Utils.isLocal) {
      return await localUpdateTag(data);
    } else {
      return await localUpdateTag(data);
    }
  }

  static Future<dynamic> updateTaskTag(
      {required String projectId,
      required String workspaceId,
      required Map data}) async {
    if (Utils.isLocal) {
      return await localUpdateTaskTag(workspaceId, projectId, data);
    } else {
      return await localUpdateTaskTag(workspaceId, projectId, data);
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

  static Future<dynamic> updateTask(
      {required String projectId,
      required String taskListId,
      required String taskid,
      required Map taskData}) async {
    if (Utils.isLocal) {
      return await localUpdateTask(
          projectId: projectId,
          taskListId: taskListId,
          taskId: taskid,
          taskData: taskData);
    } else {
      return await localUpdateTask(
          projectId: projectId,
          taskListId: taskListId,
          taskId: taskid,
          taskData: taskData);
    }
  }

  static Future<dynamic> deleteTag({required String id}) async {
    if (Utils.isLocal) {
      return await localDeleteTag(id);
    } else {
      return await localDeleteTag(id);
    }
  }

  static Future<dynamic> deleteTaskTag(
      {required String workspaceId,
      required String projectId,
      required String id}) async {
    if (Utils.isLocal) {
      return await localDeleteTaskTag(workspaceId, projectId, id);
    } else {
      return await localDeleteTaskTag(workspaceId, projectId, id);
    }
  }

  static Future<dynamic> deleteTask(
      {required String workspaceId,
      required String projectId,
      required String listId,
      required String taskId}) async {
    if (Utils.isLocal) {
      return await localDeleteTask(workspaceId, projectId, listId, taskId);
    } else {
      return await localDeleteTask(workspaceId, projectId, listId, taskId);
    }
  }

  static Future<dynamic> deleteTaskList(
      {required String workspaceId,
      required String projectId,
      required String listId}) async {
    if (Utils.isLocal) {
      return await localDeleteTaskList(workspaceId, projectId, listId);
    } else {
      return await localDeleteTaskList(workspaceId, projectId, listId);
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

  static Future<dynamic> createProject({
    required String workspace,
    required String id,
    required Map projectData,
  }) async {
    if (Utils.isLocal) {
      return await localCreateProject(
          workspace: workspace, id: id, projectData: projectData);
    } else {
      return await localCreateProject(
          workspace: workspace, id: id, projectData: projectData);
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

  static Future<dynamic> createActivityLog({required Map data}) async {
    if (Utils.isLocal) {
      return await localCreateActivityLog(data);
    } else {
      return await localCreateActivityLog(data);
    }
  }

  static Future<List> getActivityLogs() async {
    if (Utils.isLocal) {
      return await localGetActivityLogs();
    } else {
      return await localGetActivityLogs();
    }
  }
}
