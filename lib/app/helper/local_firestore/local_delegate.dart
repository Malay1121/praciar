import 'package:praciar/app/helper/all_imports.dart';

class LocalDelegate {
  LocalDelegate({required this.dataPath});
  String dataPath;
  void collection(String collection) {
    dataPath = "$dataPath\\$collection";
  }

  List<LocalDocumentSnapshot> getCollection() {
    Directory directory = Directory(dataPath);
    List<FileSystemEntity> directorySync = directory.listSync();

    List<LocalDocumentSnapshot> docs = [];
    for (FileSystemEntity file in directorySync) {
      docs.add(LocalDocumentSnapshot(delegate: this));
    }
    return docs;
  }

  void doc(String doc) {
    dataPath = "$dataPath/$doc";
  }

  Future<Map> getDoc() async {
    File file = File(dataPath);
    Map document = jsonDecode(await file.readAsString());
    return document;
  }
}
