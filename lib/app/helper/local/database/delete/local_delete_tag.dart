import 'package:praciar/app/helper/all_imports.dart';

import '../create/local_write_data.dart';

Future<List> localDeleteTag(String id) async {
  return await run(() async {
    Map data = (await localReadData());
    data["tags"].removeWhere((element) => id == element["id"]);
    await localWriteData(data);
    return data["tags"];
  });
}
