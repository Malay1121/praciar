import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/routes/app_pages.dart';
import 'package:windows_notification/notification_message.dart';
import '../../../../main.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            Get.toNamed(Routes.TABLE_VIEW);
          },
          child: Text(
            'HomeView is working',
            style: TextStyles.regular(context: context, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
