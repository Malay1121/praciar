import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/modules/project_dashboard/views/project_dashboard_view_desktop.dart';

import '../../../helper/all_imports.dart';
import '../controllers/project_dashboard_controller.dart';

class ProjectDashboardView extends GetView<ProjectDashboardController> {
  const ProjectDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectDashboardController>(
        init: ProjectDashboardController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: ProjectDashboardViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
