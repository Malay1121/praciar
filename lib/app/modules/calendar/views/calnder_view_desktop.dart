import 'package:praciar/app/helper/local_firestore/local_query_snapshot.dart';
import 'package:praciar/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:praciar/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:praciar/app/widgets/common_button.dart';
import 'package:praciar/app/widgets/common_image.dart';
import 'package:praciar/app/widgets/update_task_popup.dart';
import 'package:watcher/watcher.dart';

import '../../../helper/all_imports.dart';

class CalendarViewDesktop extends StatefulWidget {
  CalendarViewDesktop({required this.controller});
  CalendarController controller;
  @override
  State<CalendarViewDesktop> createState() => _CalendarViewDesktopState();
}

class _CalendarViewDesktopState extends State<CalendarViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonSidebar(
            selectedTab: AppStrings.calendar.toLowerCase(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w(context),
                    vertical: 32.h(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonHeader(
                        title: AppStrings.calendar,
                      ),
                      SizedBox(
                        height: 44.h(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            alignment: WrapAlignment.start,
                            spacing: 24.w(context),
                            children: [
                              for (String view in widget.controller.views)
                                InkWell(
                                  onTap: () =>
                                      widget.controller.changeView(view),
                                  child: Column(
                                    children: [
                                      AppText(
                                        width: 76.w(context),
                                        height: 21.h(context),
                                        centered: true,
                                        text: view.toString() + " View",
                                        style: TextStyles.medium(
                                          context: context,
                                          fontSize: 14.t(context),
                                          color: view ==
                                                  widget.controller.selectedView
                                              ? AppColors.secondary500
                                              : AppColors.secondary300,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h(context),
                                      ),
                                      Container(
                                        width: 76.w(context),
                                        height: 2.h(context),
                                        color: view ==
                                                widget.controller.selectedView
                                            ? AppColors.primary500
                                            : AppColors.primary0,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 768.h(context),
                        child: widget.controller.selectedView == "Month"
                            ? MonthView(
                                width: 1124.w(context),
                                controller: widget.controller.eventController,
                                cellAspectRatio: 1,
                                headerStringBuilder: (date, {secondaryDate}) {
                                  return "${date.month}/${date.year}";
                                },
                                onEventTap: (event, date) {
                                  Map taskData = event.event as Map;
                                  openTaskDetails(
                                    projectId: Utils.getKey(
                                        taskData, ["_projectId"], ""),
                                    listId:
                                        Utils.getKey(taskData, ["_listId"], ""),
                                    taskId: Utils.getKey(taskData, ["id"], ""),
                                  );
                                },
                              )
                            : DayView(
                                width: 1124.w(context),
                                controller: widget.controller.eventController,
                                // cellAspectRatio: 1,
                                // headerStringBuilder: (date, {secondaryDate}) {
                                //   return "${date.month}/${date.year}";
                                // },
                                onEventTap: (event, date) {
                                  Map taskData = event as Map;
                                  openTaskDetails(
                                    projectId: Utils.getKey(
                                        taskData, ["_projectId"], ""),
                                    listId:
                                        Utils.getKey(taskData, ["_listId"], ""),
                                    taskId: Utils.getKey(taskData, ["id"], ""),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
