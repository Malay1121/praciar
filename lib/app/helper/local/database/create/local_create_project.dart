import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';

Future<List> localCreateProject({
  required String workspace,
  required String id,
  required Map projectData,
}) async {
  return await run(() async {
    Map data = (await localReadData());
    data["workspaces"]
        .firstWhere((element) => element["id"] == workspace)["projects"]
        .add(projectData);
    await localWriteData(data);
    return data["projects"];
  });
}
