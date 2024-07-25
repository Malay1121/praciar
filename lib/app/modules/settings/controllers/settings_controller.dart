import 'package:get/get.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';

import '../../../helper/all_imports.dart';

class SettingsController extends GetxController {
  String selectedCategory = AppStrings.general.toLowerCase();
  Map options = {
    "general": {},
    "appearance": {
      "mode": {
        "type": "multichoice",
        "parameter": "mode",
        "options": [
          {
            "name": "Light",
          },
          {
            "name": "Dark",
          },
        ],
      },
    },
  };
  Map tasks = {
    "general": {},
    "appearance": {
      "mode": {
        "type": "multichoice",
        "parameter": "mode",
        "options": [
          {
            "onClick": () => Utils.changeTheme(),
          },
          {
            "onClick": () => Utils.changeTheme(),
          },
        ],
      },
    },
  };
  Map settings = {};

  void changeCategory(String category) {
    selectedCategory = category;
    update();
  }

  void getSettings() async {
    settings = (await localReadData())["settings"];
  }

  void changeSettings(
      {required String category,
      required String parameter,
      required Map newValue}) async {
    settings = await DatabaseHelper.updateSettings(
        category: category, parameter: parameter, newValue: newValue);
    tasks[category][parameter]["onClick"];
    update();
  }

  Widget settingWidget(
      {required String type,
      required String category,
      required String parameter,
      required List options}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: AppStrings.mode,
          style: TextStyles.semiBold(
            context: Get.context!,
            fontSize: 14,
            color: AppColors.secondary500,
          ),
          height: 21.h(Get.context!),
        ),
        SizedBox(
          height: 16.h(Get.context!),
        ),
        Wrap(
          spacing: 24.w(Get.context!),
          children: [
            for (Map option in options)
              InkWell(
                onTap: () => changeSettings(
                    category: category, parameter: parameter, newValue: option),
                child: Container(
                  height: 50.h(Get.context!),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w(Get.context!),
                    vertical: 15.h(Get.context!),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1,
                          color: option["name"] ==
                                  (settings[category] == null
                                      ? ""
                                      : (settings[category][parameter] == null)
                                          ? ""
                                          : settings[category][parameter]
                                              ["name"])
                              ? AppColors.primary500
                              : AppColors.cardColor)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        text: option["name"],
                        style: TextStyles.medium(
                          context: Get.context!,
                          fontSize: 12,
                          color: AppColors.secondary500,
                        ),
                      ),
                      SizedBox(
                        width: 74.w(Get.context!),
                      ),
                      Container(
                        width: 20.w(Get.context!),
                        height: 20.h(Get.context!),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: option["name"] ==
                                      (settings[category] == null
                                          ? ""
                                          : (settings[category][parameter] ==
                                                  null)
                                              ? ""
                                              : settings[category][parameter]
                                                  ["name"])
                                  ? AppColors.primary500
                                  : AppColors.cardColor,
                              width: option["name"] ==
                                      (settings[category] == null
                                          ? ""
                                          : (settings[category][parameter] ==
                                                  null)
                                              ? ""
                                              : settings[category][parameter]
                                                  ["name"])
                                  ? 4
                                  : 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
    getSettings();
    print(settings);
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
