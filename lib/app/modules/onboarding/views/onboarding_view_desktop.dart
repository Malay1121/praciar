import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:praciar/app/widgets/common_button.dart';

class OnboardingViewDesktop extends StatefulWidget {
  OnboardingViewDesktop({super.key, required this.controller});
  OnboardingController controller;

  @override
  State<OnboardingViewDesktop> createState() => _OnboardingViewDesktopState();
}

class _OnboardingViewDesktopState extends State<OnboardingViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SizedBox(
            width: 1440.w(context),
            height: 1024.h(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200.h(context),
                ),
                AppText(
                  text: AppStrings.letsGetYouStarted,
                  width: 840.w(context),
                  height: 60.h(context),
                  centered: true,
                  style: TextStyles.semiBold(
                      context: context,
                      fontSize: 40,
                      color: AppColors.secondary500),
                ),
                SizedBox(
                  height: 50.h(context),
                ),
                AppText(
                  text: Utils.greet(),
                  width: 840.w(context),
                  height: 135.h(context),
                  centered: true,
                  style: TextStyles.semiBold(
                      context: context,
                      fontSize: 90,
                      color: AppColors.secondary500),
                ),
                SizedBox(
                  width: 840.w(context),
                  height: 135.h(context),
                  child: TextField(
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: true,
                    style: TextStyles.semiBold(
                      context: context,
                      fontSize: 90,
                      color: AppColors.primary500,
                    ),
                    cursorColor: AppColors.primary500,
                    cursorHeight: 135.h(context),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: AppStrings.yourName,
                      hintStyle: TextStyles.semiBold(
                        context: context,
                        fontSize: 90,
                        color: AppColors.primary300,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.h(context),
                ),
                CommonButton(
                  text: AppStrings.getStarted,
                  width: 287.w(context),
                  height: 44.h(context),
                  backgroundColor: AppColors.primary500,
                  textColor: AppColors.primary0,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.h(context),
              horizontal: 32.w(context),
            ),
            child: Image.asset(
              AppImages.logoShort,
              width: 188.w(context),
              // height: 40.h(context),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
