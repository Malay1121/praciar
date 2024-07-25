import 'package:praciar/app/helper/all_imports.dart';

import '../create/local_write_data.dart';

Future<Map> localUpdateSettings(
    {required String category,
    required String parameter,
    required Map newValue}) async {
  Map data = await localReadData();
  if (data["settings"] == null) {
    data["settings"] = {};
  }
  if (data["settings"][category] == null) {
    data["settings"][category] = {};
  }
  data["settings"][category][parameter] = newValue;
  return (await localWriteData(data))["settings"];
}
