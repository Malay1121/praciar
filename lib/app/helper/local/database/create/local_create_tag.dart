import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';

Future<List> localCreateTag(Map tag) async {
  return await run(() async {
    Map data = (await localReadData());
    List updatedTags = Utils.addItemToList(data, ["tags"], tag);
    data.containsKey("tags")
        ? data["tags"] = updatedTags
        : data.addEntries({"tags": updatedTags}.entries);
    await localWriteData(data);
    return data["tags"];
  });
}
