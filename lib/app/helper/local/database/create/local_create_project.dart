import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';

Future<List> localCreateProject({
  required String workspace,
  required String id,
  required String name,
  required String description,
  required DateTimeRange duration,
}) async {
  return await run(() async {
    Map projectTemplate = {
      "id": id,
      "name": name,
      "description": description,
      "status": "active",
      "created_at": Utils.toUtc(DateTime.now()),
      "updated_at": Utils.toUtc(DateTime.now()),
      "start_date": Utils.toUtc(duration.start),
      "end_date": Utils.toUtc(duration.end),
      "task_list": [
        {"id": "todo", "name": "TODO", "color": "FFFFF", "tasks": []}
      ]
    };
    Map data = (await localReadData());
    data["workspaces"]
        .firstWhere((element) => element["id"] == workspace)["projects"]
        .add(projectTemplate);
    await localWriteData(data);
    return data["projects"];
  });
}
