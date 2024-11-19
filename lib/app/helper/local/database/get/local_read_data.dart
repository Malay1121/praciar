import 'package:praciar/app/helper/local_firestore/local_firestore.dart';

import '/app/helper/all_imports.dart';

Future<Map> localReadData() async {
  return await run(() async {
    String path = await Utils.getDataPath();
    File file = File('$path/data.json');
    file.watch(recursive: true).asBroadcastStream();
    return jsonDecode(await file.readAsString());
  });
}
