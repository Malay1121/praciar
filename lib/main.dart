import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/helper/database_helper.dart';
import 'package:windows_notification/windows_notification.dart';

import 'app/routes/app_pages.dart';

var winNotifyPlugin;
void main() {
  DatabaseHelper.createDatabase();
  winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");
  runApp(
    GetMaterialApp(
      title: "Praciar",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
