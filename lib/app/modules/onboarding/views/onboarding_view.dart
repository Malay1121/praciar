import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import '../controllers/onboarding_controller.dart';
import 'onboarding_view_desktop.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: OnboardingViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
