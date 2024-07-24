import 'package:get/get.dart';
import 'package:praciar/app/modules/settings/views/settings_view_desktop.dart';

import '../../../helper/all_imports.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: SettingsViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
