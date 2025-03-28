import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/helper/responsive_helper.dart';
import 'package:praciar/app/modules/project_table_view/views/project_table_view_view_desktop.dart';

import '../controllers/project_table_view_controller.dart';

class ProjectTableViewView extends GetView<ProjectTableViewController> {
  const ProjectTableViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectTableViewController>(
        init: ProjectTableViewController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: ProjectTableViewViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
