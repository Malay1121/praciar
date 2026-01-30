import 'package:praciar/app/helper/all_imports.dart';

Future<List> localGetActivityLogs() async {
  return await run(() async {
    Map data = await localReadData();
    List activityLogs = Utils.getKey(data, ["activity_log"], []);
    activityLogs.sort((a, b) => Utils.fromUtc(b["created_at"])
        .compareTo(Utils.fromUtc(a["created_at"])));
    return activityLogs;
  });
}

Future<List> localGetProjectActivityLogs(String projectId) async {
  return await run(() async {
    Map data = await localReadData();
    List activityLogs = Utils.getKey(data, ["activity_log"], []);
    List projectLogs = activityLogs
        .where((log) => Utils.getKey(log, ["project_id"], "") == projectId)
        .toList();
    projectLogs.sort((a, b) => Utils.fromUtc(b["created_at"])
        .compareTo(Utils.fromUtc(a["created_at"])));
    return projectLogs;
  });
}
