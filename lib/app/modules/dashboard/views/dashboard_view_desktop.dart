import 'package:praciar/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../../../helper/all_imports.dart';

class DashboardViewDesktop extends StatefulWidget {
  DashboardViewDesktop({required this.controller});
  DashboardController controller;
  @override
  State<DashboardViewDesktop> createState() => _DashboardViewDesktopState();
}

class _DashboardViewDesktopState extends State<DashboardViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonSidebar(
            selectedTab: 0,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w(context),
                  vertical: 32.h(context),
                ),
                child: Column(
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
