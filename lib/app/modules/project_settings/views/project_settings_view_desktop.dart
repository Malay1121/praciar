import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/project_settings/controllers/project_settings_controller.dart';

class ProjectSettingsViewDesktop extends StatefulWidget {
  ProjectSettingsViewDesktop({required this.controller});

  ProjectSettingsController controller;

  @override
  State<ProjectSettingsViewDesktop> createState() =>
      _ProjectSettingsViewDesktopState();
}

class _ProjectSettingsViewDesktopState
    extends State<ProjectSettingsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonProjectSidebar(
            selectedTab: AppStrings.projectSettings.toLowerCase(),
            projectId: widget.controller.projectId,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 32.h(context),
                    left: 32.w(context),
                    right: 32.w(context),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary0,
                  ),
                  child: Column(
                    children: [
                      CommonHeader(
                        title: AppStrings.projectSettings,
                      ),
                      SizedBox(
                        height: 44.h(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GetBuilder<ProjectSettingsController>(
                    builder: (controller) {
                      if (controller.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary500,
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.w(context),
                          vertical: 32.h(context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(24.w(context)),
                              decoration: BoxDecoration(
                                color: AppColors.primary0,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.secondary100.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Project Information",
                                    style: TextStyles.semiBold(
                                      context: context,
                                      fontSize: 16.t(context),
                                      color: AppColors.secondary500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h(context)),
                                  AppText(
                                    text: AppStrings.projectName,
                                    style: TextStyles.medium(
                                      context: context,
                                      fontSize: 12.t(context),
                                      color: AppColors.secondary400,
                                    ),
                                  ),
                                  SizedBox(height: 8.h(context)),
                                  CommonTextField(
                                    hintText: "Enter project name",
                                    controller: controller.nameController,
                                    width: double.infinity,
                                    height: 48,
                                  ),
                                  SizedBox(height: 20.h(context)),
                                  AppText(
                                    text: AppStrings.projectDescription,
                                    style: TextStyles.medium(
                                      context: context,
                                      fontSize: 12.t(context),
                                      color: AppColors.secondary400,
                                    ),
                                  ),
                                  SizedBox(height: 8.h(context)),
                                  CommonTextField(
                                    hintText: "Enter project description",
                                    controller:
                                        controller.descriptionController,
                                    width: double.infinity,
                                    maxLines: 3,
                                    height: 96,
                                  ),
                                  SizedBox(height: 20.h(context)),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              text: "Project Status",
                                              style: TextStyles.medium(
                                                context: context,
                                                fontSize: 12.t(context),
                                                color: AppColors.secondary400,
                                              ),
                                            ),
                                            SizedBox(height: 8.h(context)),
                                            Container(
                                              width: double.infinity,
                                              height: 48,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20.w(context),
                                                vertical: 14.h(context),
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: AppColors.cardColor,
                                                  width: 1,
                                                ),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value:
                                                      controller.selectedStatus,
                                                  isExpanded: true,
                                                  style: TextStyles.regular(
                                                    context: context,
                                                    fontSize: 12.t(context),
                                                    color:
                                                        AppColors.secondary500,
                                                  ),
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color:
                                                        AppColors.secondary400,
                                                    size: 20,
                                                  ),
                                                  onChanged:
                                                      (String? newValue) {
                                                    if (newValue != null) {
                                                      controller
                                                              .selectedStatus =
                                                          newValue;
                                                      controller.update();
                                                    }
                                                  },
                                                  items: controller
                                                      .statusOptions
                                                      .map((String status) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: status,
                                                      child: AppText(
                                                        text: status
                                                                .substring(0, 1)
                                                                .toUpperCase() +
                                                            status.substring(1),
                                                        style:
                                                            TextStyles.regular(
                                                          context: context,
                                                          fontSize:
                                                              12.t(context),
                                                          color: AppColors
                                                              .secondary500,
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h(context)),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(24.w(context)),
                              decoration: BoxDecoration(
                                color: AppColors.primary0,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.secondary100.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Project Timeline",
                                    style: TextStyles.semiBold(
                                      context: context,
                                      fontSize: 16.t(context),
                                      color: AppColors.secondary500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h(context)),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              text: "Start Date",
                                              style: TextStyles.medium(
                                                context: context,
                                                fontSize: 12.t(context),
                                                color: AppColors.secondary400,
                                              ),
                                            ),
                                            SizedBox(height: 8.h(context)),
                                            InkWell(
                                              onTap: () => controller
                                                  .selectDate("start_date"),
                                              child: Container(
                                                height: 48,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w(context),
                                                  vertical: 14.h(context),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: AppColors.cardColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: AppText(
                                                        text: controller
                                                                .startDateController
                                                                .text
                                                                .isEmpty
                                                            ? "Select start date"
                                                            : controller
                                                                .startDateController
                                                                .text,
                                                        style:
                                                            TextStyles.regular(
                                                          context: context,
                                                          fontSize:
                                                              12.t(context),
                                                          color: controller
                                                                  .startDateController
                                                                  .text
                                                                  .isEmpty
                                                              ? AppColors
                                                                  .secondary400
                                                              : AppColors
                                                                  .secondary500,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.calendar_today,
                                                      size: 16,
                                                      color: AppColors
                                                          .secondary400,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16.w(context)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              text: "End Date",
                                              style: TextStyles.medium(
                                                context: context,
                                                fontSize: 12.t(context),
                                                color: AppColors.secondary400,
                                              ),
                                            ),
                                            SizedBox(height: 8.h(context)),
                                            InkWell(
                                              onTap: () => controller
                                                  .selectDate("end_date"),
                                              child: Container(
                                                height: 48,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w(context),
                                                  vertical: 14.h(context),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: AppColors.cardColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: AppText(
                                                        text: controller
                                                                .endDateController
                                                                .text
                                                                .isEmpty
                                                            ? "Select end date"
                                                            : controller
                                                                .endDateController
                                                                .text,
                                                        style:
                                                            TextStyles.regular(
                                                          context: context,
                                                          fontSize:
                                                              12.t(context),
                                                          color: controller
                                                                  .endDateController
                                                                  .text
                                                                  .isEmpty
                                                              ? AppColors
                                                                  .secondary400
                                                              : AppColors
                                                                  .secondary500,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.calendar_today,
                                                      size: 16,
                                                      color: AppColors
                                                          .secondary400,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h(context)),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(24.w(context)),
                              decoration: BoxDecoration(
                                color: AppColors.primary0,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.secondary100.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Actions",
                                    style: TextStyles.semiBold(
                                      context: context,
                                      fontSize: 16.t(context),
                                      color: AppColors.secondary500,
                                    ),
                                  ),
                                  SizedBox(height: 24.h(context)),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonButton(
                                          text: controller.isSaving
                                              ? "Saving..."
                                              : "Save Changes",
                                          onTap: controller.isSaving
                                              ? () {}
                                              : controller.saveProject,
                                          height: 48,
                                          backgroundColor: AppColors.primary500,
                                          textColor: AppColors.primary0,
                                          fontSize: 12.t(context),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 24.w(context),
                                            vertical: 14.h(context),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w(context)),
                                      Expanded(
                                        child: CommonButton(
                                          text: "Delete Project",
                                          onTap: controller.deleteProject,
                                          height: 48,
                                          backgroundColor: AppColors.background,
                                          textColor: AppColors.error500,
                                          fontSize: 12.t(context),
                                          border: Border.all(
                                            color: AppColors.error500,
                                            width: 1,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 24.w(context),
                                            vertical: 14.h(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
