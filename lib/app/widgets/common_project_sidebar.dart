import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class CommonProjectSidebar extends StatefulWidget {
  CommonProjectSidebar({required this.selectedTab, required this.projectId});

  String selectedTab;
  String projectId;

  @override
  State<CommonProjectSidebar> createState() => _CommonProjectSidebarState();
}

class _CommonProjectSidebarState extends State<CommonProjectSidebar> {
  List<Map> tabs = [
    {
      "material_icon": Icons.arrow_back_ios,
      "title": AppStrings.back,
      "onTap": () => Get.back(),
    },
    {
      "icon": AppImages.icCategory2,
      "title": AppStrings.overview,
      "screen": Routes.PROJECT_DASHBOARD,
    },
    {
      "icon": AppImages.icBook,
      "title": AppStrings.task,
      "screen": Routes.PROJECT_TABLE_VIEW,
    },
    {
      "icon": AppImages.icTag,
      "title": AppStrings.tags,
      "screen": Routes.PROJECT_TAGS,
    },
    {
      "icon": AppImages.icTasks,
      "title": AppStrings.logs,
      "screen": Routes.PROJECT_LOGS,
    },
    {
      "icon": AppImages.icSettings,
      "title": AppStrings.projectSettings,
      "screen": Routes.PROJECT_SETTINGS,
    },
  ];

  bool tabSelected(Map tab) =>
      tab["title"].toString().toLowerCase() == widget.selectedTab.toLowerCase();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1024.h(context),
      width: 252.w(context),
      decoration: BoxDecoration(
        color: AppColors.primary0,
      ),
      child: Column(
        children: [
          Image.asset(
            AppImages.logoShort,
            width: 188.w(context),
            // height: 40.h(context),
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 30.h(context),
          ),
          for (Map tab in tabs)
            InkWell(
              onTap: () => tab.containsKey("screen")
                  ? Get.offAndToNamed(tab["screen"],
                      arguments: {"projectId": widget.projectId})
                  : tab["onTap"](),
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 24.h(context),
                ),
                width: 188.w(context),
                height: 44.h(context),
                decoration: BoxDecoration(
                  color: tabSelected(tab) ? AppColors.cardColor : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w(context),
                  ),
                  child: Row(
                    children: [
                      tab.containsKey("icon")
                          ? SvgPicture.asset(
                              tab["icon"],
                              width: 24.w(context),
                              height: 24.h(context),
                              fit: BoxFit.fitHeight,
                              color: tabSelected(tab)
                                  ? AppColors.secondary500
                                  : AppColors.secondary300,
                            )
                          : Icon(
                              tab["material_icon"],
                              size: 24.t(context),
                              color: tabSelected(tab)
                                  ? AppColors.secondary500
                                  : AppColors.secondary300,
                            ),
                      SizedBox(
                        width: 12.w(context),
                      ),
                      AppText(
                        text: tab["title"],
                        centered: true,
                        style: TextStyles.semiBold(
                          context: context,
                          fontSize: 14,
                          color: tabSelected(tab)
                              ? AppColors.secondary500
                              : AppColors.secondary300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
