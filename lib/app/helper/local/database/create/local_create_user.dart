import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/update/local_update_data.dart';

import 'local_write_data.dart';



Future<List> localCreateUser(
    {required String name, required String email, required String role}) async {
  return await run(() async {
    
    Map data = Utils.getKey(await localReadData(), [], {});
    if ((Utils.getKey(data, ["users"], []) as List).firstWhereOrNull(
          (element) => element["email"] == email,
        ) ==
        null) {
      List updatedList = Utils.addItemToList(data, ["users"], {
        "name": name,
        "email": email,
        "role": role,
        "created_at": Utils.toUtc(DateTime.now()),
      });
      await localUpdateKey(location: [], updateData: {"users": updatedList});
      await localWriteData(data);
    }

    return data["users"];
  });
}
