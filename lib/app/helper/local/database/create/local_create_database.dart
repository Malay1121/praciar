import '/app/helper/all_imports.dart';



Future<bool> localFileExists() async {
  return await run(() async {
    String path = await Utils.getDataPath();
      Directory directory = Directory(path);
      if (!(await directory.exists())) {
        directory.create(recursive: true);
      }
      File file = File('$path/data.json');
      return file.exists();
  });
}

Future localCreateDatabase() async {
  await run(() async {
    if (!(await localFileExists())) {
      
      Map starterData = {
    "workspaces": [
      {
        "id": "personal",
        "name": "Personal Space",
        "description": "Personal Space Description",
        "created_at": Utils.toUtc(DateTime.now()),
        "updated_at": Utils.toUtc(DateTime.now()),
        "users": [
         
        ],
        "projects": [
          
        ]
      }
    ],
    "users": [
    ],
    "activity_log": [
    ],
      "tags": [
    ],
    "settings": {
      "appearance": {
        "mode": {"name": "Light"}
      }
    }
  };
      String path = await Utils.getDataPath();
      File file = File('$path/data.json');
      await file.writeAsString(jsonEncode(starterData));
    }
  });
}
