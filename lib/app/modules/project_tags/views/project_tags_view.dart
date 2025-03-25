import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/helper/responsive_helper.dart';
import 'package:praciar/app/modules/project_tags/views/project_tags_view_desktop.dart';

import '../controllers/project_tags_controller.dart';

class ProjectTagsView extends GetView<ProjectTagsController> {
  const ProjectTagsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectTagsController>(
        init: ProjectTagsController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: ProjectTagsViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
