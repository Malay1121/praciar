import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

import 'local_write_data.dart';

Future<List> localCreateUser(
    {required String name, required String email, required String role}) async {
  return await run(() async {
    Map data = (await localReadData());
    if ((data["users"] as List).firstWhereOrNull(
          (element) => element["email"] == email,
        ) ==
        null) {
      data["users"].add({
        "name": name,
        "email": email,
        "role": role,
        "created_at": Utils.toUtc(DateTime.now()),
      });
      await localWriteData(data);
    }

    return data["users"];
  });
}
