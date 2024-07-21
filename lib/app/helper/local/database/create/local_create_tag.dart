import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';

Future<List> localCreateTag(Map tag) async {
  Map data = (await localReadData());
  data["tags"].add(tag);
  await localWriteData(data);
  return data["tags"];
}
