import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/project_logs/views/project_logs_view_desktop.dart';
import '../controllers/project_logs_controller.dart';

class ProjectLogsView extends GetView<ProjectLogsController> {
  const ProjectLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectLogsController>(
      init: ProjectLogsController(),
      builder: (controller) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 768) {
              return ProjectLogsViewDesktop(controller: controller);
            } else {
              return ProjectLogsViewDesktop(controller: controller);
            }
          },
        );
      },
    );
  }
}
