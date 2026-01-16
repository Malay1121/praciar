import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';

Future<List> localCreateActivityLog(Map activityLog) async {
  return await run(() async {
    Map data = (await localReadData());
    List updatedActivityLogs =
        Utils.addItemToList(data, ["activity_log"], activityLog);
    data.containsKey("activity_log")
        ? data["activity_log"] = updatedActivityLogs
        : data.addEntries({"activity_log": updatedActivityLogs}.entries);
    await localWriteData(data);
    return data["activity_log"];
  });
}
