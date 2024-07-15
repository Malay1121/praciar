import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          onTap: () {
            // Get.toNamed(Routes.TABLE_VIEW);
            const String template = '''
<toast activationType="protocol">
  <visual>
    <binding template="ToastGeneric">
      <text>Weather app</text>
      <text>Expect rain today.</text>
      <group>
        <subgroup hint-weight="1" hint-textStacking="center">
          <text hint-align="center" hint-style="header">15°</text>
          <text hint-align="center" hint-style="SubtitleSubtle">Rainy</text>
        </subgroup>
        <subgroup hint-weight="1">
          <text hint-align="center">Mon</text>
          <image src=".\image.jpg" hint-removeMargin="true" />
          <text hint-align="center">15°</text>
        </subgroup>
        <subgroup hint-weight="1">
          <text hint-align="center">Tue</text>
          <image src=".\image.jpg" hint-removeMargin="true" />
          <text hint-align="center">17°</text>
        </subgroup>
        <subgroup hint-weight="1">
          <text hint-align="center">Wed</text>
          <image src=".\image.jpg" hint-removeMargin="true" />
          <text hint-align="center">21°</text>
        </subgroup>
      </group>
    </binding>
  </visual>
</toast>
''';

            NotificationMessage message =
                NotificationMessage.fromPluginTemplate(
                    "test1",
                    "Project name Reminder!",
                    "You have to complete making the app before 3 June 2024",
                    group: "weather_group",
                    launch: "praciar://table-view");
            winNotifyPlugin.showNotificationPluginTemplate(message);
          },
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
