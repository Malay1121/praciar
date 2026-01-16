import 'package:praciar/app/helper/local_firestore/local_firestore.dart';

import '/app/helper/all_imports.dart';

Future<Map> localReadData() async {
  return await run(() async {
    String path = await Utils.getDataPath();
    File file = File('$path/data.json');
    Map data = {};
    if (await file.exists()) {
      file.watch(recursive: true).asBroadcastStream();
      String fdata = (await file.readAsString());
      if (fdata.isEmpty) {
        await localCreateDatabase();
      } else {
        data = jsonDecode(fdata);
      }
    } else {
      localCreateDatabase();
    }
    return data;
  });
}
