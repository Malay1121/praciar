import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

void main() {
  DatabaseHelper.createDatabase();
  initializeSize(1440, 1024);

  runApp(
    GetMaterialApp(
      title: AppStrings.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
