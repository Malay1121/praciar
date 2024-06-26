import '/app/helper/all_imports.dart';

Future<List<Project>> localGetProjects() async {
  UserData data = await localReadData();
  return data.projects;
}
