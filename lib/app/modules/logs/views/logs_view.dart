import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/logs/views/logs_view_desktop.dart';

import '../controllers/logs_controller.dart';

class LogsView extends GetView<LogsController> {
  const LogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogsController>(
      init: LogsController(),
      builder: (controller) {
        return Responsive(
          mobile: Container(
            child: Center(
              child: Text("Mobile view not implemented"),
            ),
          ),
          tablet: Container(
            child: Center(
              child: Text("Tablet view not implemented"),
            ),
          ),
          desktop: LogsViewDesktop(
            controller: controller,
          ),
        );
      },
    );
  }
}
