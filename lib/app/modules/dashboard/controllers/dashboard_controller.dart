import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  Widget getWeekdays(value, meta) {
    TextStyle style = TextStyles.medium(
      context: Get.context!,
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

    return AppText(text: text, style: style, textAlign: TextAlign.center);
  }

  Widget getProjectNumber(value, meta) {
    TextStyle style = TextStyles.medium(
      context: Get.context!,
      fontSize: 12,
      color: AppColors.secondary500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      default:
        return Container();
    }

    return AppText(text: text, style: style, textAlign: TextAlign.center);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
