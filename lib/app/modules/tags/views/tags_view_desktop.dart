import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/tags/controllers/tags_controller.dart';
import 'package:praciar/app/widgets/common_button.dart';
import 'package:praciar/app/widgets/common_textfield.dart';

class TagsViewDesktop extends StatefulWidget {
  TagsViewDesktop({
    super.key,
    required this.controller,
  });
  TagsController controller;
  @override
  State<TagsViewDesktop> createState() => _TagsViewDesktopState();
}

class _TagsViewDesktopState extends State<TagsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonSidebar(
            selectedTab: AppStrings.tags.toLowerCase(),
          ),
          Column(
            children: [
              Container(
                width: 1188.w(context),
                height: 192.h(context),
                padding: EdgeInsets.symmetric(
                  vertical: 32.h(context),
                  horizontal: 32.w(context),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary0,
                ),
                child: Column(
                  children: [
                    CommonHeader(
                      title: AppStrings.exploreTag,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    SizedBox(
                      width: 1124.w(context),
                      child: Row(
                        children: [
                          CommonTextField(
                            hintText: AppStrings.searchTags,
                            suffixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: 28.w(context)),
                              child: SvgPicture.asset(
                                AppImages.icSearch,
                                width: 20.w(context),
                                height: 20.h(context),
                                color: AppColors.secondary300,
                              ),
                            ),
                            suffixIconConstraints: BoxConstraints(
                              minWidth: 20.w(context),
                              minHeight: 20.h(context),
                            ),
                          ),
                          Spacer(),
                          CommonButton(
                            text: "Sort by: Popular",
                            onTap: () {},
                            prefix: SvgPicture.asset(
                              AppImages.icSort,
                              width: 24.w(context),
                              height: 24.h(context),
                              color: AppColors.secondary300,
                            ),
                            textColor: AppColors.secondary500,
                            fontSize: 12.t(context),
                            height: 52.h(context),
                            padding: EdgeInsets.symmetric(
                              horizontal: 28.w(context),
                            ),
                            border: Border.all(
                              color: AppColors.cardColor,
                            ),
                          ),
                          SizedBox(
                            width: 24.w(context),
                          ),
                          CommonButton(
                            text: AppStrings.newTag,
                            onTap: () {},
                            backgroundColor: AppColors.primary500,
                            prefix: SvgPicture.asset(
                              AppImages.icAdd,
                              width: 24.w(context),
                              height: 24.h(context),
                              color: AppColors.primary0,
                            ),
                            textColor: AppColors.primary0,
                            fontSize: 12.t(context),
                            padding: EdgeInsets.symmetric(
                              horizontal: 28.w(context),
                            ),
                            height: 52.h(context),
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
