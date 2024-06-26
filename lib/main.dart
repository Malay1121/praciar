import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/helper/database_helper.dart';

import 'app/routes/app_pages.dart';

void main() {
  DatabaseHelper.createDatabase();
  runApp(
    GetMaterialApp(
      title: "Praciar",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
