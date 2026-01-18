import 'package:praciar/app/helper/all_imports.dart';

Future<List> localGetActivityLogs() async {
  return await run(() async {
    Map data = await localReadData();
    List activityLogs = Utils.getKey(data, ["activity_log"], []);
    // Sort by created_at in descending order (newest first)
    activityLogs.sort((a, b) => Utils.fromUtc(b["created_at"])
        .compareTo(Utils.fromUtc(a["created_at"])));
    return activityLogs;
  });
}

// Get activity logs for a specific project
Future<List> localGetProjectActivityLogs(String projectId) async {
  return await run(() async {
    Map data = await localReadData();
    List activityLogs = Utils.getKey(data, ["activity_log"], []);
    // Filter logs for the specific project
    List projectLogs = activityLogs
        .where((log) => Utils.getKey(log, ["project_id"], "") == projectId)
        .toList();
    // Sort by created_at in descending order (newest first)
    projectLogs.sort((a, b) => Utils.fromUtc(b["created_at"])
        .compareTo(Utils.fromUtc(a["created_at"])));
    return projectLogs;
  });
}
