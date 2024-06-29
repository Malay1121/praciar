import '/app/helper/all_imports.dart';

Future<Map> localGetProject(String projectName) async {
  List projectList = await localGetKey(location: ["projects"]);
  Map output = {};
  for (var project in projectList) {
    if (projectName == project["name"]) {
      output = project;
    }
  }
  return output;
}
