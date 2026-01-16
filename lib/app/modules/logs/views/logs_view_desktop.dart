import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/logs/controllers/logs_controller.dart';

class LogsViewDesktop extends StatefulWidget {
  LogsViewDesktop({super.key, required this.controller});

  final LogsController controller;

  @override
  State<LogsViewDesktop> createState() => _LogsViewDesktopState();
}

class _LogsViewDesktopState extends State<LogsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonSidebar(
            selectedTab: AppStrings.logs.toLowerCase(),
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
                        title: AppStrings.activityLog,
                      ),
                      SizedBox(height: 24.h(context)),
                      Row(
                        children: [
                          AppText(
                            text: AppStrings.activityDescription,
                            style: TextStyles.regular(
                              context: context,
                              fontSize: 14,
                              color: AppColors.secondary400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 32.h(context),
                      horizontal: 32.w(context),
                    ),
                    child: widget.controller.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary500,
                            ),
                          )
                        : widget.controller.activityLogs.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.icTasks,
                                      width: 64.w(context),
                                      height: 64.h(context),
                                      color: AppColors.secondary300,
                                    ),
                                    SizedBox(height: 24.h(context)),
                                    AppText(
                                      text: AppStrings.noActivityYet,
                                      style: TextStyles.semiBold(
                                        context: context,
                                        fontSize: 18,
                                        color: AppColors.secondary400,
                                      ),
                                    ),
                                    SizedBox(height: 8.h(context)),
                                    AppText(
                                      text:
                                          "Start creating projects and tasks to see your activity here",
                                      style: TextStyles.regular(
                                        context: context,
                                        fontSize: 14,
                                        color: AppColors.secondary300,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    for (int index = 0;
                                        index <
                                            widget
                                                .controller.activityLogs.length;
                                        index++)
                                      _buildActivityItem(
                                        widget.controller.activityLogs[index],
                                        index,
                                        context,
                                      ),
                                  ],
                                ),
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

  Widget _buildActivityItem(Map activity, int index, BuildContext context) {
    String action = Utils.getKey(activity, ["action"], "").toString();
    String entityType = Utils.getKey(activity, ["entity_type"], "").toString();
    String entityName = Utils.getKey(activity, ["entity_name"], "").toString();
    String createdAt = Utils.getKey(activity, ["created_at"], "").toString();
    String description = Utils.getKey(activity, ["description"], "").toString();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h(context)),
      padding: EdgeInsets.all(24.w(context)),
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
          // Action Icon
          Container(
            width: 48.w(context),
            height: 48.h(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.controller.getActionColor(action).withOpacity(0.1),
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.controller.getActionIcon(action, entityType),
                width: 20.w(context),
                height: 20.h(context),
                color: widget.controller.getActionColor(action),
              ),
            ),
          ),
          SizedBox(width: 16.w(context)),

          // Activity Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Entity Type Icon
                    SvgPicture.asset(
                      widget.controller.getEntityTypeIcon(entityType),
                      width: 16.w(context),
                      height: 16.h(context),
                      color: AppColors.secondary400,
                    ),
                    SizedBox(width: 8.w(context)),

                    // Activity Title
                    Expanded(
                      child: AppText(
                        text: widget.controller
                            .formatActivityDescription(activity),
                        style: TextStyles.semiBold(
                          context: context,
                          fontSize: 16,
                          color: AppColors.secondary500,
                        ),
                      ),
                    ),
                  ],
                ),

                if (description.isNotEmpty &&
                    description !=
                        widget.controller.formatActivityDescription(activity))
                  Padding(
                    padding: EdgeInsets.only(top: 8.h(context)),
                    child: AppText(
                      text: description,
                      style: TextStyles.regular(
                        context: context,
                        fontSize: 14,
                        color: AppColors.secondary400,
                      ),
                    ),
                  ),

                SizedBox(height: 8.h(context)),

                // Timestamp
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14.w(context),
                      color: AppColors.secondary300,
                    ),
                    SizedBox(width: 4.w(context)),
                    AppText(
                      text: widget.controller.getRelativeTime(createdAt),
                      style: TextStyles.regular(
                        context: context,
                        fontSize: 12,
                        color: AppColors.secondary300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action Badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w(context),
              vertical: 4.h(context),
            ),
            decoration: BoxDecoration(
              color: widget.controller.getActionColor(action).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    widget.controller.getActionColor(action).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: AppText(
              text: action.toUpperCase(),
              style: TextStyles.medium(
                context: context,
                fontSize: 10,
                color: widget.controller.getActionColor(action),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
