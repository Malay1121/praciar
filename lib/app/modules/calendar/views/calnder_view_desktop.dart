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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 236.w(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: AppStrings.hi + ", Malay Patel",
                                  style: TextStyles.semiBold(
                                    context: context,
                                    fontSize: 24,
                                    color: AppColors.secondary500,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h(context),
                                ),
                                AppText(
                                  text: AppStrings.letsFinishYourTaskToday,
                                  style: TextStyles.medium(
                                    context: context,
                                    fontSize: 16,
                                    color: AppColors.secondary400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 324.w(context),
                          ),
                          Container(
                            width: 52.w(context),
                            height: 52.h(context),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.cardColor,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 14.h(context),
                                horizontal: 14.w(context),
                              ),
                              child: SvgPicture.asset(
                                AppImages.icNotification,
                                color: AppColors.secondary300,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24.w(context),
                          ),
                          Container(
                            width: 52.w(context),
                            height: 52.h(context),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://placehold.co/52x52",
                                ),
                                fit: BoxFit.fill,
                              ),
                              border: Border.all(
                                color: AppColors.cardColor,
                                width: 1,
                              ),
                            ),
                          ),
                        ],
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
                          // cellBuilder: (date, event, isToday, isInMonth,
                          //     hideDaysNotInMonth) {
                          //   return Container(
                          //     decoration: BoxDecoration(
                          //       color: isToday
                          //           ? AppColors.primary100
                          //           : AppColors.cardColor,
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //     child: Padding(
                          //       padding: EdgeInsets.all(8.w(context)),
                          //       child: Column(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           AppText(
                          //             text: date.day.toString(),
                          //             style: TextStyles.semiBold(
                          //               context: context,
                          //               fontSize: 16,
                          //               color: isToday
                          //                   ? AppColors.primary500
                          //                   : AppColors.secondary900,
                          //             ),
                          //           ),
                          //           if (event != null)
                          //             CommonImage(
                          //               imageUrl: date.toString(),
                          //               fit: BoxFit.cover,
                          //               width: 32.w(context),
                          //               height: 32.h(context),
                          //             ),
                          //         ],
                          //       ),
                          //     ),
                          //   );
                          // },
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
