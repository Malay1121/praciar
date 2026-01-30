import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/settings/controllers/settings_controller.dart';

class SettingsViewDesktop extends StatefulWidget {
  SettingsViewDesktop({
    super.key,
    required this.controller,
  });
  SettingsController controller;
  @override
  State<SettingsViewDesktop> createState() => _SettingsViewDesktopState();
}

class _SettingsViewDesktopState extends State<SettingsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonSidebar(
                  selectedTab: AppStrings.settings.toLowerCase(),
                ),
                Column(
                  children: [
                    Container(
                      width: 1188.w(context),
                      height: 116.h(context),
                      padding: EdgeInsets.symmetric(
                        vertical: 32.h(context),
                        horizontal: 32.w(context),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary0,
                      ),
                      child: CommonHeader(
                        title: AppStrings.settings,
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 32.h(context),
                          horizontal: 32.w(context),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 1124.w(context),
                              padding: EdgeInsets.symmetric(
                                vertical: 32.h(context),
                                horizontal: 32.w(context),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary0,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h(context),
                                      horizontal: 4.w(context),
                                    ),
                                    child: Row(
                                      children: [
                                        for (String category in widget
                                            .controller.options.keys) ...[
                                          InkWell(
                                            onTap: () => widget.controller
                                                .changeCategory(category),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 12.h(context),
                                                horizontal: 20.w(context),
                                              ),
                                              decoration: BoxDecoration(
                                                color: category ==
                                                        widget.controller
                                                            .selectedCategory
                                                    ? AppColors.primary500
                                                        .withOpacity(0.1)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: category ==
                                                          widget.controller
                                                              .selectedCategory
                                                      ? AppColors.primary500
                                                      : Colors.transparent,
                                                  width: 1,
                                                ),
                                              ),
                                              child: AppText(
                                                text: category.capitalizeFirst
                                                    .toString(),
                                                style: TextStyles.semiBold(
                                                  context: context,
                                                  fontSize: 14.t(context),
                                                  color: category ==
                                                          widget.controller
                                                              .selectedCategory
                                                      ? AppColors.primary500
                                                      : AppColors.secondary400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (category !=
                                              widget
                                                  .controller.options.keys.last)
                                            SizedBox(width: 8.w(context)),
                                        ],
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32.h(context),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h(context),
                                      horizontal: 20.w(context),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.background,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: widget
                                                  .controller
                                                  .selectedCategory
                                                  .capitalizeFirst ??
                                              '',
                                          style: TextStyles.bold(
                                            context: context,
                                            fontSize: 18,
                                            color: AppColors.secondary500,
                                          ),
                                        ),
                                        SizedBox(height: 4.h(context)),
                                        AppText(
                                          text: _getCategoryDescription(widget
                                              .controller.selectedCategory),
                                          style: TextStyles.regular(
                                            context: context,
                                            fontSize: 14,
                                            color: AppColors.secondary400,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.h(context),
                                  ),
                                  for (String parameter in widget
                                      .controller
                                      .options[
                                          widget.controller.selectedCategory]
                                      .keys) ...[
                                    widget.controller.settingWidget(
                                      type: widget.controller.options[widget
                                          .controller
                                          .selectedCategory][parameter]["type"],
                                      category:
                                          widget.controller.selectedCategory,
                                      parameter: widget.controller.options[
                                              widget
                                                  .controller.selectedCategory]
                                          [parameter]["parameter"],
                                      options: widget.controller.options[widget
                                              .controller.selectedCategory]
                                          [parameter]["options"],
                                    ),
                                    SizedBox(height: 24.h(context)),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  String _getCategoryDescription(String category) {
    switch (category) {
      case 'general':
        return "Basic app preferences and global settings";
      case 'appearance':
        return "Customize the look and feel of your interface";
      case 'productivity':
        return "Settings to help you work more efficiently";
      case 'privacy':
        return "Control your data and privacy preferences";
      default:
        return "Configure your app settings";
    }
  }
}
