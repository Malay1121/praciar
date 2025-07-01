import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:praciar/app/modules/calendar/views/calnder_view_desktop.dart';

import '../../../helper/all_imports.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
        init: CalendarController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: CalendarViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
