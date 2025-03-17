import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';

import '../create/local_write_data.dart';

Future<Map> localUpdateProject(
    {required String projectId, required Map projectData}) async {
  Map data = await localReadData();
  int workspaceIndex = (data["workspaces"] as List)
      .indexWhere((element) => element["id"] == Utils.currentWorkspace);
  int projectIndex = (data["workspaces"][workspaceIndex]["projects"] as List)
      .indexWhere((element) => element["id"] == projectId);
  data["workspaces"][workspaceIndex]["projects"][projectIndex] = projectData;
  await localWriteData(data);
  return projectData;
}
