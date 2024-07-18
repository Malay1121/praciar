import 'package:praciar/app/helper/all_imports.dart';

class CommonSidebar extends StatefulWidget {
  CommonSidebar({required this.selectedTab});

  int selectedTab;

  @override
  State<CommonSidebar> createState() => _CommonSidebarState();
}

class _CommonSidebarState extends State<CommonSidebar> {
  List<Map> tabs = [
    {
      "icon": AppImages.icCategory2,
      "title": AppStrings.overview,
      // "screen": AppImages.icCategory2,
    },
    {
      "icon": AppImages.icBook,
      "title": AppStrings.task,
      // "screen": AppImages.icCategory2,
    },
    {
      "icon": AppImages.icSettings,
      "title": AppStrings.task,
      // "screen": AppImages.icCategory2,
    },
  ];

  bool tabSelected(Map tab) => tab == tabs[widget.selectedTab];
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
            Container(
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
                    SvgPicture.asset(
                      tab["icon"],
                      width: 24.w(context),
                      height: 24.h(context),
                      fit: BoxFit.fitHeight,
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
        ],
      ),
    );
  }
}
