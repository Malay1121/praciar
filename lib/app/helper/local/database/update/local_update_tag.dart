import 'package:praciar/app/helper/all_imports.dart';

import '../create/local_write_data.dart';

Future<List> localUpdateTag(Map tagData) async {
  return await run(() async {
    Map data = (await localReadData());

    Map tag =
        data["tags"].firstWhere((element) => element["id"] == tagData["id"]);
    tag["name"] = tagData["name"];
    tag["color"] = tagData["color"];
    if (tag["updated_at"] is List) {
      tag["updated_at"].add(Utils.toUtc(
        DateTime.now(),
      ));
    } else {
      tag["updated_at"] = [
        Utils.toUtc(
          DateTime.now(),
        )
      ];
    }

    await localWriteData(data);
    return data["tags"];
  });
}
