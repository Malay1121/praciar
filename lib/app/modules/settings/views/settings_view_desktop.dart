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
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    spacing: 24.w(context),
                                    children: [
                                      for (String category
                                          in widget.controller.options.keys)
                                        InkWell(
                                          onTap: () => widget.controller
                                              .changeCategory(category),
                                          child: Column(
                                            children: [
                                              AppText(
                                                width: 76.w(context),
                                                height: 21.h(context),
                                                centered: true,
                                                text: category.capitalizeFirst
                                                    .toString(),
                                                style: TextStyles.medium(
                                                  context: context,
                                                  fontSize: 14.t(context),
                                                  color: category ==
                                                          widget.controller
                                                              .selectedCategory
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
                                                color: category ==
                                                        widget.controller
                                                            .selectedCategory
                                                    ? AppColors.primary500
                                                    : AppColors.primary0,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 32.h(context),
                                  ),
                                  for (String parameter in widget
                                      .controller
                                      .options[
                                          widget.controller.selectedCategory]
                                      .keys)
                                    widget.controller.settingWidget(
                                      type: widget.controller.options[widget
                                          .controller
                                          .selectedCategory][parameter]["type"],
                                      category: "appearance",
                                      parameter: widget.controller.options[
                                              widget
                                                  .controller.selectedCategory]
                                          [parameter]["parameter"],
                                      options: widget.controller.options[widget
                                              .controller.selectedCategory]
                                          [parameter]["options"],
                                    ),
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
}
