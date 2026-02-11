import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/modules/project_settings/views/project_settings_view_desktop.dart';

import '../controllers/project_settings_controller.dart';

class ProjectSettingsView extends GetView<ProjectSettingsController> {
  const ProjectSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectSettingsController>(
        init: ProjectSettingsController(),
        builder: (controller) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 768) {
                return ProjectSettingsViewDesktop(controller: controller);
              } else {
                return ProjectSettingsViewDesktop(controller: controller);
              }
            },
          );
        });
  }
}
