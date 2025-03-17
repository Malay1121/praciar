import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/project_dashboard/controllers/project_dashboard_controller.dart';

class ProjectDashboardViewDesktop extends StatefulWidget {
  ProjectDashboardViewDesktop({required this.controller});

  ProjectDashboardController controller;

  @override
  State<ProjectDashboardViewDesktop> createState() =>
      _ProjectDashboardViewDesktopState();
}

class _ProjectDashboardViewDesktopState
    extends State<ProjectDashboardViewDesktop> {
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
