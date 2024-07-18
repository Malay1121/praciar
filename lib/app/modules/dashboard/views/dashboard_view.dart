import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/helper/responsive_helper.dart';
import 'package:praciar/app/modules/dashboard/views/dashboard_view_desktop.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: DashboardViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
