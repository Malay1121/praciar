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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: 44.h(context),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 194.w(context),
                          height: 214.h(context),
                          decoration: BoxDecoration(
                            color: AppColors.secondary500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h(context),
                              horizontal: 20.w(context),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: AppStrings.runningTask,
                                  height: 24.h(context),
                                  style: TextStyles.semiBold(
                                    context: context,
                                    fontSize: 16,
                                    color: AppColors.primary0,
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h(context),
                                ),
                                AppText(
                                  text: "65",
                                  height: 48.h(context),
                                  style: TextStyles.semiBold(
                                    context: context,
                                    fontSize: 32,
                                    color: AppColors.primary0,
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h(context),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // width: 68.w(context),
                                      height: 68.h(context),
                                      child: CircularPercentIndicator(
                                        radius: 34.h(context),
                                        lineWidth: 3.0,
                                        percent: 0.5,
                                        center: AppText(
                                          text: "45%",
                                          width: 44.w(context),
                                          height: 24.h(context),
                                          centered: true,
                                          style: TextStyles.medium(
                                            context: context,
                                            fontSize: 18,
                                            color: AppColors.primary0,
                                          ),
                                        ),
                                        progressColor: AppColors.primary500,
                                        backgroundColor:
                                            Color(0xFFD8D8D8).withOpacity(0.1),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.w(context),
                                    ),
                                    Column(
                                      children: [
                                        AppText(
                                          text: "100",
                                          style: TextStyles.semiBold(
                                            context: context,
                                            fontSize: 20,
                                            color: AppColors.primary0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h(context),
                                        ),
                                        AppText(
                                          text: AppStrings.task,
                                          style: TextStyles.medium(
                                            context: context,
                                            fontSize: 14,
                                            color: AppColors.secondary400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32.w(context),
                        ),
                        Container(
                          width: 462.w(context),
                          height: 214.h(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w(context),
                            vertical: 20.h(context),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  AppText(
                                    text: AppStrings.activity,
                                    height: 24.h(context),
                                    width: 60.w(context),
                                    style: TextStyles.semiBold(
                                      context: context,
                                      fontSize: 16,
                                      color: AppColors.secondary500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 302.w(context),
                                  ),
                                  AppText(
                                    text: AppStrings.thisWeek,
                                    width: 60.w(context),
                                    height: 24.h(context),
                                    style: TextStyles.medium(
                                      context: context,
                                      fontSize: 12,
                                      color: AppColors.secondary500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h(context),
                              ),
                              SizedBox(
                                width: 422.w(context),
                                height: 130.h(context),
                                child: LineChart(
                                  LineChartData(
                                    titlesData: FlTitlesData(
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(),
                                      ),
                                      rightTitles: AxisTitles(
                                        sideTitles: SideTitles(),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles: SideTitles(),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          getTitlesWidget: (value, meta) {
                                            TextStyle style = TextStyles.medium(
                                              context: context,
                                              fontSize: 12,
                                              color: AppColors.secondary500,
                                            );
                                            String text;
                                            switch (value.toInt()) {
                                              case 0:
                                                text = 'S';
                                                break;
                                              case 1:
                                                text = 'M';
                                                break;
                                              case 2:
                                                text = 'T';
                                                break;
                                              case 3:
                                                text = 'W';
                                                break;
                                              case 4:
                                                text = 'T';
                                                break;
                                              case 5:
                                                text = 'F';
                                                break;
                                              case 6:
                                                text = 'S';
                                                break;
                                              default:
                                                return Container();
                                            }

                                            return AppText(
                                                text: text,
                                                style: style,
                                                textAlign: TextAlign.center);
                                          },
                                          interval: 1,
                                          showTitles: true,
                                        ),
                                      ),
                                    ),
                                    lineBarsData: [
                                      LineChartBarData(
                                          color: AppColors.secondary500,
                                          barWidth: 3,
                                          isCurved: true,
                                          preventCurveOverShooting: true,
                                          spots: [
                                            FlSpot(0, 1),
                                            FlSpot(1, 1),
                                            FlSpot(2, 0),
                                            FlSpot(3, 3),
                                            FlSpot(4, 1),
                                            FlSpot(5, 2),
                                            FlSpot(6, 3),
                                          ],
                                          dotData: FlDotData(show: false)),
                                    ],
                                  ),

                                  duration:
                                      Duration(milliseconds: 150), // Optional
                                  curve: Curves.linear, // Optional
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
            ],
          ),
        ],
      ),
    );
  }
}
