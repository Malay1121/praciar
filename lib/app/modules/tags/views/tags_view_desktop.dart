import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/helper/app_images.dart';
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
                            width: 480.w(context),
                            height: 48.h(context),
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
                            text:
                                "${AppStrings.sortBy}: ${AppStrings.popularity}",
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
                            onTap: () => widget.controller.addNewTag(),
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
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 32.h(context),
                    horizontal: 32.w(context),
                  ),
                  child: Column(
                    children: [
                      for (var tag in widget.controller.tags)
                        Container(
                          width: 1124.w(context),
                          height: 78.h(context),
                          margin: EdgeInsets.only(
                            bottom: 24.h(context),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h(context),
                            horizontal: 24.w(context),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary0,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 26.w(context),
                                height: 26.h(context),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary500,
                                ),
                              ),
                              SizedBox(
                                width: 18.w(context),
                              ),
                              AppText(
                                text: tag["name"],
                                height: 24.h(context),
                                style: TextStyles.semiBold(
                                  context: context,
                                  fontSize: 16,
                                  color: AppColors.secondary500,
                                ),
                              ),
                              SizedBox(
                                width: 75.w(context),
                              ),
                              SvgPicture.asset(
                                AppImages.icTasks,
                                width: 24.w(context),
                                height: 24.h(context),
                                color: AppColors.secondary400,
                              ),
                              SizedBox(
                                width: 8.w(context),
                              ),
                              AppText(
                                text: "40",
                                height: 24.h(context),
                                style: TextStyles.medium(
                                  context: context,
                                  fontSize: 14,
                                  color: AppColors.secondary500,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                AppImages.icClock,
                                width: 24.w(context),
                                height: 24.h(context),
                                color: AppColors.secondary400,
                              ),
                              SizedBox(
                                width: 8.w(context),
                              ),
                              AppText(
                                text: Utils.formatDateTime(
                                        Utils.fromUtc(tag["created_at"]))
                                    .toString(),
                                height: 24.h(context),
                                style: TextStyles.regular(
                                  context: context,
                                  fontSize: 14,
                                  color: AppColors.secondary400,
                                ),
                              ),
                              SizedBox(
                                width: 20.w(context),
                              ),
                              InkWell(
                                onTap: () =>
                                    widget.controller.addNewTag(tag: tag),
                                child: Container(
                                  width: 30.h(context),
                                  height: 30.h(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.cardColor,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImages.icEdit,
                                      width: 16.w(context),
                                      height: 16.h(context),
                                      color: AppColors.secondary500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w(context),
                              ),
                              PopupMenuButton(
                                constraints: BoxConstraints(
                                  minWidth: 152.w(context),
                                ),
                                padding: EdgeInsets.zero,
                                shape: Border.all(
                                  color: AppColors.cardColor,
                                ),
                                shadowColor: Colors.transparent,
                                color: AppColors.primary0,
                                itemBuilder: (BuildContext context) =>
                                    widget.controller.popupMenuButtons(tag),
                                child: Container(
                                  width: 30.h(context),
                                  height: 30.h(context),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primary500,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImages.icMore,
                                      width: 16.w(context),
                                      height: 16.h(context),
                                      color: AppColors.primary0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
