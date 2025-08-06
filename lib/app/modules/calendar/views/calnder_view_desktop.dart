import 'package:praciar/app/helper/local_firestore/local_query_snapshot.dart';
import 'package:praciar/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:praciar/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:praciar/app/widgets/common_button.dart';
import 'package:praciar/app/widgets/common_image.dart';
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
                        title: AppStrings.exploreTag,
                      ),
                      SizedBox(
                        height: 44.h(context),
                      ),
                      SizedBox(
                        height: 768.h(context),
                        child: MonthView(
                          width: 1124.w(context),
                          controller: widget.controller.eventController,
                          cellAspectRatio: 1,
                          headerStringBuilder: (date, {secondaryDate}) {
                            return "${date.month}/${date.year}";
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
