import 'package:praciar/app/helper/local_firestore/local_query_snapshot.dart';
import 'package:praciar/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:praciar/app/widgets/common_button.dart';
import 'package:praciar/app/widgets/common_image.dart';
import 'package:watcher/watcher.dart';

import '../../../helper/all_imports.dart';

class DashboardViewDesktop extends StatefulWidget {
  DashboardViewDesktop({required this.controller});
  DashboardController controller;
  @override
  State<DashboardViewDesktop> createState() => _DashboardViewDesktopState();
}

class _DashboardViewDesktopState extends State<DashboardViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonSidebar(
            selectedTab: AppStrings.overview.toLowerCase(),
          ),
          Row(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w(context),
                    vertical: 32.h(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "https://via.placeholder.com/52x52",
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
                      Row(
                        children: [
                          Container(
                            width: 194.w(context),
                            height: 214.h(context),
                            decoration: BoxDecoration(
                              color: AppColors.secondary500,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20.h(context),
                                horizontal: 20.w(context),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: AppStrings.runningTask,
                                    height: 24.h(context),
                                    style: TextStyles.semiBold(
                                      context: context,
                                      fontSize: 16,
                                      color: AppColors.primary0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h(context),
                                  ),
                                  AppText(
                                    text: "65",
                                    height: 48.h(context),
                                    style: TextStyles.semiBold(
                                      context: context,
                                      fontSize: 32,
                                      color: AppColors.primary0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h(context),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        // width: 68.w(context),
                                        height: 68.h(context),
                                        child: CircularPercentIndicator(
                                          radius: 34.h(context),
                                          lineWidth: 3.0,
                                          percent: 0.5,
                                          center: AppText(
                                            text: "45%",
                                            width: 44.w(context),
                                            height: 24.h(context),
                                            centered: true,
                                            style: TextStyles.medium(
                                              context: context,
                                              fontSize: 18,
                                              color: AppColors.primary0,
                                            ),
                                          ),
                                          progressColor: AppColors.primary500,
                                          backgroundColor: Color(0xFFD8D8D8)
                                              .withOpacity(0.1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 18.w(context),
                                      ),
                                      Column(
                                        children: [
                                          AppText(
                                            text: "100",
                                            style: TextStyles.semiBold(
                                              context: context,
                                              fontSize: 20,
                                              color: AppColors.primary0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h(context),
                                          ),
                                          AppText(
                                            text: AppStrings.task,
                                            style: TextStyles.medium(
                                              context: context,
                                              fontSize: 14,
                                              color: AppColors.secondary300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32.w(context),
                          ),
                          Container(
                            width: 462.w(context),
                            height: 214.h(context),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w(context),
                              vertical: 20.h(context),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    AppText(
                                      text: AppStrings.activity,
                                      height: 24.h(context),
                                      width: 60.w(context),
                                      style: TextStyles.semiBold(
                                        context: context,
                                        fontSize: 16,
                                        color: AppColors.secondary500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 302.w(context),
                                    ),
                                    AppText(
                                      text: AppStrings.thisWeek,
                                      width: 60.w(context),
                                      height: 24.h(context),
                                      style: TextStyles.medium(
                                        context: context,
                                        fontSize: 12,
                                        color: AppColors.secondary500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h(context),
                                ),
                                Container(
                                  width: 422.w(context),
                                  height: 130.h(context),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary0,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 16.h(context),
                                      left: 16.w(context),
                                      right: 16.w(context),
                                    ),
                                    child: LineChart(
                                      LineChartData(
                                        lineTouchData: LineTouchData(
                                          touchTooltipData:
                                              LineTouchTooltipData(
                                            getTooltipColor: (touchedSpot) =>
                                                AppColors.secondary500,
                                            getTooltipItems: (touchedSpots) {
                                              return touchedSpots.map(
                                                  (LineBarSpot touchedSpot) {
                                                final textStyle =
                                                    TextStyles.semiBold(
                                                  context: context,
                                                  color: AppColors.primary0,
                                                  fontSize: 14,
                                                );
                                                return LineTooltipItem(
                                                  '${touchedSpot.y.toInt()} ${AppStrings.task}',
                                                  textStyle,
                                                );
                                              }).toList();
                                            },
                                          ),
                                          handleBuiltInTouches: true,
                                          getTouchLineStart: (data, index) => 0,
                                        ),
                                        backgroundColor: AppColors.primary0,
                                        borderData: FlBorderData(
                                          border: Border.symmetric(
                                            vertical: BorderSide(
                                              color: AppColors.cardColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(
                                          verticalInterval: 1,
                                          getDrawingVerticalLine: (value) {
                                            return FlLine(
                                              color: AppColors.cardColor,
                                              strokeWidth: 1,
                                            );
                                          },
                                        ),
                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              interval: 1,
                                              getTitlesWidget: (value, meta) =>
                                                  widget.controller
                                                      .getProjectNumber(
                                                          value, meta),
                                            ),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles: SideTitles(),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              getTitlesWidget: (value, meta) =>
                                                  widget.controller
                                                      .getWeekdays(value, meta),
                                              interval: 1,
                                              showTitles: true,
                                            ),
                                          ),
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                              color: AppColors.secondary500,
                                              barWidth: 3,
                                              isCurved: true,
                                              preventCurveOverShooting: true,
                                              spots: [
                                                FlSpot(0, 0),
                                                FlSpot(1, 1),
                                                FlSpot(2, 0),
                                                FlSpot(3, 2),
                                                FlSpot(4, 1),
                                                FlSpot(5, 2),
                                                FlSpot(6, 0),
                                              ],
                                              dotData: FlDotData(show: false)),
                                        ],
                                      ),

                                      duration: Duration(
                                          milliseconds: 150), // Optional
                                      curve: Curves.linear, // Optional
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: widget.controller.getUpcomingTasks(),
                        builder: (context, snapshot) {
                          List tasks = snapshot.data ?? [];
                          return tasks.isEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 32.h(context),
                                    ),
                                    Row(
                                      children: [
                                        AppText(
                                          text: AppStrings.upcomingTask,
                                          style: TextStyles.semiBold(
                                            context: context,
                                            fontSize: 24,
                                            color: AppColors.secondary500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h(context),
                                    ),
                                    SizedBox(
                                      width: 688.w(context),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            for (Map task in tasks)
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 32.w(context)),
                                                width: 328.w(context),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary0,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 24.w(context),
                                                  vertical: 24.h(context),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: CommonImage(
                                                        imageUrl:
                                                            "https://via.placeholder.com/280x110",
                                                        width: 280.w(context),
                                                        height: 110.h(context),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 16.h(context),
                                                    ),
                                                    AppText(
                                                      text: task["title"],
                                                      height: 24.h(context),
                                                      width: 280.w(context),
                                                      style:
                                                          TextStyles.semiBold(
                                                        context: context,
                                                        fontSize: 16,
                                                        color: AppColors
                                                            .secondary500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4.h(context),
                                                    ),
                                                    SizedBox(
                                                      width: 280.w(context),
                                                      height: 16.h(context),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        physics:
                                                            BouncingScrollPhysics(),
                                                        child: Row(
                                                          children: [
                                                            for (Map tag
                                                                in task["tags"])
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal: 5
                                                                      .w(context),
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color:
                                                                      HexColor(
                                                                    tag["color"],
                                                                  ),
                                                                ),
                                                                child: AppText(
                                                                  text: tag[
                                                                      "name"],
                                                                  height: 16.h(
                                                                      context),
                                                                  style:
                                                                      TextStyles
                                                                          .medium(
                                                                    context:
                                                                        context,
                                                                    fontSize:
                                                                        12,
                                                                    color: AppColors
                                                                        .primary0,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 16.h(context),
                                                    ),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImages.icClock,
                                                          width: 24.w(context),
                                                          height: 24.h(context),
                                                          color: AppColors
                                                              .secondary400,
                                                        ),
                                                        SizedBox(
                                                          width: 8.w(context),
                                                        ),
                                                        StreamBuilder(
                                                            stream:
                                                                Stream.periodic(
                                                                    const Duration(
                                                                        seconds:
                                                                            1)),
                                                            builder: (context,
                                                                snapshot) {
                                                              return AppText(
                                                                text:
                                                                    "${Utils.formatDateTimeDifference(DateTime.now(), Utils.fromUtc(task["due_date"]))} ${AppStrings.left}",
                                                                height: 24
                                                                    .h(context),
                                                                style:
                                                                    TextStyles
                                                                        .medium(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16,
                                                                  color: AppColors
                                                                      .secondary500,
                                                                ),
                                                              );
                                                            }),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            // Text(
                                            //     "${task["title"]} -  ${Utils.formatDateTime(Utils.fromUtc(task["due_date"]))}"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox();
                        },
                      ),
                      FutureBuilder(
                        future: DatabaseHelper.getPinnedProject(),
                        builder: (context, snapshot) {
                          List projects = snapshot.data ?? [];

                          void togglePin(Map project) {
                            project["pinned"] = project["pinned"] is bool
                                ? !project["pinned"]
                                : true;
                            DatabaseHelper.updateProject(
                                projectId: project["id"], projectData: project);
                          }

                          return projects.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 32.h(context),
                                    ),
                                    Row(
                                      children: [
                                        AppText(
                                          text: AppStrings.pinnedProjects,
                                          style: TextStyles.semiBold(
                                            context: context,
                                            fontSize: 24,
                                            color: AppColors.secondary500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h(context),
                                    ),
                                    SizedBox(
                                      width: 688.w(context),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            for (Map project in projects)
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 32.w(context)),
                                                width: 328.w(context),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary0,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 24.w(context),
                                                  vertical: 24.h(context),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: CommonImage(
                                                        imageUrl:
                                                            "https://via.placeholder.com/280x110",
                                                        width: 280.w(context),
                                                        height: 110.h(context),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 16.h(context),
                                                    ),
                                                    AppText(
                                                      text: project["name"],
                                                      height: 24.h(context),
                                                      width: 280.w(context),
                                                      style:
                                                          TextStyles.semiBold(
                                                        context: context,
                                                        fontSize: 16,
                                                        color: AppColors
                                                            .secondary500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4.h(context),
                                                    ),
                                                    SizedBox(
                                                      width: 280.w(context),
                                                      height: 16.h(context),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        physics:
                                                            BouncingScrollPhysics(),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 5
                                                                    .w(context),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: project[
                                                                            "status"] ==
                                                                        "active"
                                                                    ? AppColors
                                                                        .success500
                                                                    : AppColors
                                                                        .error500,
                                                              ),
                                                              child: AppText(
                                                                text: project[
                                                                    "status"],
                                                                height: 16
                                                                    .h(context),
                                                                style:
                                                                    TextStyles
                                                                        .medium(
                                                                  context:
                                                                      context,
                                                                  fontSize: 12,
                                                                  color: AppColors
                                                                      .primary0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 16.h(context),
                                                    ),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImages.icClock,
                                                          width: 24.w(context),
                                                          height: 24.h(context),
                                                          color: AppColors
                                                              .secondary400,
                                                        ),
                                                        SizedBox(
                                                          width: 8.w(context),
                                                        ),
                                                        StreamBuilder(
                                                            stream:
                                                                Stream.periodic(
                                                                    const Duration(
                                                                        seconds:
                                                                            1)),
                                                            builder: (context,
                                                                snapshot) {
                                                              return AppText(
                                                                text:
                                                                    "${Utils.formatDateTimeDifference(DateTime.now(), Utils.fromUtc(project["end_date"]))} ${AppStrings.left}",
                                                                height: 24
                                                                    .h(context),
                                                                style:
                                                                    TextStyles
                                                                        .medium(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16.t(
                                                                      context),
                                                                  color: AppColors
                                                                      .secondary500,
                                                                ),
                                                              );
                                                            }),
                                                        Spacer(),
                                                        IconButton(
                                                          icon: Icon(
                                                            project["pinned"] ==
                                                                    true
                                                                ? Icons.star
                                                                : Icons
                                                                    .star_border_outlined,
                                                            size: 20.t(context),
                                                          ),
                                                          onPressed: () =>
                                                              togglePin(
                                                                  project),
                                                          color: AppColors
                                                              .secondary500,
                                                          splashRadius:
                                                              20.t(context),
                                                          hoverColor: AppColors
                                                              .secondary500
                                                              .withOpacity(0.1),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            // Text(
                                            //     "${task["title"]} -  ${Utils.formatDateTime(Utils.fromUtc(task["due_date"]))}"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 436.w(context),
                height: 1024.h(context),
                padding: EdgeInsets.symmetric(
                  vertical: 32.h(context),
                  horizontal: 32.w(context),
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 372.w(context),
                      // height: 160.h(context),
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h(context),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary0,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyles.medium(
                            context: context,
                            fontSize: 12,
                            color: AppColors.secondary500,
                          ),
                          weekendStyle: TextStyles.medium(
                            context: context,
                            fontSize: 12,
                            color: AppColors.secondary500,
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonPadding: EdgeInsets.zero,
                          titleTextStyle: TextStyles.semiBold(
                            context: context,
                            fontSize: 14,
                            color: AppColors.secondary500,
                          ),
                          titleCentered: true,
                          formatButtonVisible: false,
                          headerPadding: EdgeInsets.only(
                            bottom: 24.h(context),
                          ),
                        ),
                        calendarFormat: CalendarFormat.week,
                        rowHeight: 32.h(context),
                        calendarStyle: CalendarStyle(
                          cellMargin: EdgeInsets.zero,
                          weekendDecoration: BoxDecoration(
                            color: AppColors.cardColor,
                            shape: BoxShape.circle,
                          ),
                          weekendTextStyle: TextStyles.medium(
                            context: context,
                            fontSize: 12,
                            color: AppColors.secondary500,
                          ),
                          defaultTextStyle: TextStyles.medium(
                            context: context,
                            fontSize: 12,
                            color: AppColors.secondary500,
                          ),
                          defaultDecoration: BoxDecoration(
                            color: AppColors.cardColor,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: TextStyles.medium(
                            context: context,
                            fontSize: 12,
                            color: AppColors.primary0,
                          ),
                          todayDecoration: BoxDecoration(
                            color: AppColors.primary500,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h(context),
                    ),
                    Container(
                      width: 372.w(context),
                      // height: 160.h(context),
                      padding: EdgeInsets.symmetric(
                        vertical: 24.h(context),
                        horizontal: 24.w(context),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary0,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              AppText(
                                text: AppStrings.taskToday,
                                style: TextStyle(
                                  color: AppColors.secondary500,
                                  fontFamily: AppStrings.fontFamily,
                                  fontSize: 14.t(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20.h(context),
                                ),
                                child: CommonImage(
                                  imageUrl: "",
                                  fit: BoxFit.cover,
                                  height: 160.h(context),
                                  width: 324.w(context),
                                  type: "file",
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20.h(context),
                                ),
                                child: AppText(
                                  text: "Creating Awesome Mobile Apps",
                                  style: TextStyle(
                                    color: AppColors.secondary500,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.t(context),
                                    fontFamily: AppStrings.fontFamily,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 4.h(context),
                                ),
                                child: AppText(
                                  text: "UI /UX Designer",
                                  style: TextStyle(
                                    color: AppColors.secondary400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.t(context),
                                    fontFamily: AppStrings.fontFamily,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 32.h(context),
                                ),
                                child: Container(
                                  height: 1,
                                  width: 324.w(context),
                                  color: AppColors.cardColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 32.h(context),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        AppText(
                                          text: AppStrings.detailTask,
                                          style: TextStyle(
                                            color: AppColors.secondary500,
                                            fontFamily: AppStrings.fontFamily,
                                            fontSize: 16.t(context),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Spacer(),
                                        AppText(
                                          text: "UI /UX Designer",
                                          style: TextStyle(
                                            color: AppColors.secondary500,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.t(context),
                                            fontFamily: AppStrings.fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 20.h(context),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 36.w(context),
                                            height: 36.w(context),
                                            decoration: BoxDecoration(
                                              color: AppColors.cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: AppText(
                                                text: "1",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: AppColors.secondary500,
                                                  fontFamily:
                                                      AppStrings.fontFamily,
                                                  fontSize: 14.t(context),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12.w(context),
                                          ),
                                          AppText(
                                            text:
                                                "Understanding the tools in Figma",
                                            width: 276.w(context),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppColors.secondary500,
                                              fontFamily: AppStrings.fontFamily,
                                              fontSize: 14.t(context),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 32.h(context),
                                ),
                                child: CommonButton(
                                  text: AppStrings.goToDetail,
                                  backgroundColor: AppColors.primary500,
                                  width: 324.w(context),
                                  height: 44.h(context),
                                  textColor: AppColors.primary0,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
