import 'package:praciar/app/helper/local/database/create/local_write_data.dart';

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
      String path = await Utils.getDataPath();
      File file = File('$path/data.json');
      await file.writeAsString(jsonEncode(jsonEncode({})));
    }
    Map starterData = {
      "workspaces": [
        {
          "id": "personal",
          "name": "Personal Space",
          "description": "Personal Space Description",
          "created_at": Utils.toUtc(DateTime.now()),
          "updated_at": Utils.toUtc(DateTime.now()),
          "users": [],
          "projects": [
          
        ]
      }
      ],
      "users": [],
      "activity_log": [],
      "tags": [],
      "settings": {
        "general": {
          "language": {"name": "English"},
          "notifications": {"name": "Enabled"},
          "defaultWorkspace": {"name": "Personal"}
        },
        "appearance": {
          "mode": {"name": "Light"},
          "fontSize": {"name": "Medium"},
          "compactView": {"name": "Disabled"},
          "accentColor": {"name": "Blue"}
        },
        "productivity": {
          "autoSave": {"name": "Enabled"},
          "taskReminders": {"name": "Enabled"},
          "timeTracking": {"name": "Always"},
          "smartSuggestions": {"name": "Enabled"}
        },
        "privacy": {
          "dataBackup": {"name": "Weekly"},
          "analytics": {"name": "Enabled"},
          "crashReports": {"name": "Enabled"}
        }
      }
    };
    localWriteData(starterData);
  });
}
