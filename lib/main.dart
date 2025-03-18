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
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary500,
          onPrimary: AppColors.primary0,
          secondary: AppColors.secondary500,
          onSecondary: AppColors.primary0,
          error: AppColors.error500,
          onError: AppColors.primary0,
          surface: AppColors.cardColor,
          onSurface: AppColors.secondary900,
          background: AppColors.background,
        ),
      ),
    ),
  );
}
