import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/project_logs/controllers/project_logs_controller.dart';

class ProjectLogsViewDesktop extends StatefulWidget {
  ProjectLogsViewDesktop({super.key, required this.controller});

  final ProjectLogsController controller;

  @override
  State<ProjectLogsViewDesktop> createState() => _ProjectLogsViewDesktopState();
}

class _ProjectLogsViewDesktopState extends State<ProjectLogsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonProjectSidebar(
            selectedTab: AppStrings.logs.toLowerCase(),
            projectId: widget.controller.projectId,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 32.h(context),
                    left: 32.w(context),
                    right: 32.w(context),
                    bottom: 32.h(context),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary0,
                  ),
                  child: Column(
                    children: [
                      CommonHeader(
                        title: AppStrings.projectLogs,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w(context),
                      vertical: 32.h(context),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                    ),
                    child: GetBuilder<ProjectLogsController>(
                      builder: (controller) {
                        if (controller.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary500,
                            ),
                          );
                        }

                        if (controller.activityLogs.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppImages.icTasks,
                                  width: 64.w(context),
                                  height: 64.h(context),
                                  color: AppColors.secondary300,
                                ),
                                SizedBox(height: 16.h(context)),
                                AppText(
                                  text:
                                      "No activity logs found for this project",
                                  style: TextStyles.regular(
                                    context: context,
                                    fontSize: 16,
                                    color: AppColors.secondary400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return ListView.separated(
                          itemCount: controller.activityLogs.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 16.h(context),
                          ),
                          itemBuilder: (context, index) {
                            Map activity = controller.activityLogs[index];
                            String action =
                                Utils.getKey(activity, ["action"], "");
                            String entityType =
                                Utils.getKey(activity, ["entity_type"], "");
                            String entityName =
                                Utils.getKey(activity, ["entity_name"], "");
                            String description =
                                Utils.getKey(activity, ["description"], "");
                            String createdAt =
                                Utils.getKey(activity, ["created_at"], "");

                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20.w(context)),
                              decoration: BoxDecoration(
                                color: AppColors.primary0,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.cardColor,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48.w(context),
                                    height: 48.h(context),
                                    decoration: BoxDecoration(
                                      color: controller
                                          .getActionColor(action)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        controller.getActionIcon(
                                            action, entityType),
                                        width: 24.w(context),
                                        height: 24.h(context),
                                        color:
                                            controller.getActionColor(action),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w(context)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              controller.getEntityTypeIcon(
                                                  entityType),
                                              width: 16.w(context),
                                              height: 16.h(context),
                                              color: AppColors.secondary400,
                                            ),
                                            SizedBox(width: 8.w(context)),
                                            AppText(
                                              text: entityType.capitalize
                                                  .toString(),
                                              style: TextStyles.semiBold(
                                                context: context,
                                                fontSize: 12,
                                                color: AppColors.secondary400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h(context)),
                                        AppText(
                                          text: controller
                                              .formatActivityDescription(
                                                  activity),
                                          style: TextStyles.semiBold(
                                            context: context,
                                            fontSize: 16,
                                            color: AppColors.secondary500,
                                          ),
                                        ),
                                        if (description.isNotEmpty &&
                                            description !=
                                                controller
                                                    .formatActivityDescription(
                                                        activity))
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 4.h(context)),
                                            child: AppText(
                                              text: description,
                                              style: TextStyles.regular(
                                                context: context,
                                                fontSize: 14,
                                                color: AppColors.secondary400,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  AppText(
                                    text: controller.getRelativeTime(createdAt),
                                    style: TextStyles.regular(
                                      context: context,
                                      fontSize: 12,
                                      color: AppColors.secondary300,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
