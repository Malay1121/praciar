import 'package:get/get.dart';
import 'package:praciar/app/helper/local/database/create/local_write_data.dart';

import '../../../helper/all_imports.dart';

class SettingsController extends CommonController {
  String selectedCategory = AppStrings.general.toLowerCase();
  Map options = {
    "general": {
      "language": {
        "type": "multichoice",
        "parameter": "language",
        "options": [
          {"name": AppStrings.english},
          {"name": AppStrings.hindi},
          {"name": AppStrings.spanish},
          {"name": AppStrings.french},
          {"name": AppStrings.german},
        ],
      },
      "notifications": {
        "type": "multichoice",
        "parameter": "notifications",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
      "defaultWorkspace": {
        "type": "multichoice",
        "parameter": "defaultWorkspace",
        "options": [
          {"name": AppStrings.personal},
          {"name": AppStrings.work},
          {"name": AppStrings.team},
        ],
      },
    },
    "appearance": {
      "mode": {
        "type": "multichoice",
        "parameter": "mode",
        "options": [
          {"name": "Light"},
          {"name": "Dark"},
        ],
      },
      "fontSize": {
        "type": "multichoice",
        "parameter": "fontSize",
        "options": [
          {"name": AppStrings.small},
          {"name": AppStrings.medium},
          {"name": AppStrings.large},
        ],
      },
      "compactView": {
        "type": "multichoice",
        "parameter": "compactView",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
      "accentColor": {
        "type": "multichoice",
        "parameter": "accentColor",
        "options": [
          {"name": AppStrings.blue},
          {"name": AppStrings.green},
          {"name": AppStrings.purple},
          {"name": AppStrings.red},
        ],
      },
    },
    "productivity": {
      "autoSave": {
        "type": "multichoice",
        "parameter": "autoSave",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
      "taskReminders": {
        "type": "multichoice",
        "parameter": "taskReminders",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
      "timeTracking": {
        "type": "multichoice",
        "parameter": "timeTracking",
        "options": [
          {"name": AppStrings.always},
          {"name": AppStrings.never},
        ],
      },
      "smartSuggestions": {
        "type": "multichoice",
        "parameter": "smartSuggestions",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
    },
    "privacy": {
      "dataBackup": {
        "type": "multichoice",
        "parameter": "dataBackup",
        "options": [
          {"name": AppStrings.daily},
          {"name": AppStrings.weekly},
          {"name": AppStrings.never},
        ],
      },
      "analytics": {
        "type": "multichoice",
        "parameter": "analytics",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
      "crashReports": {
        "type": "multichoice",
        "parameter": "crashReports",
        "options": [
          {"name": AppStrings.enabled},
          {"name": AppStrings.disabled},
        ],
      },
    },
  };
  Map settings = {};
  void _onLanguageChange() {
    Utils.changeLanguage();
    update();
  }

  void _onNotificationsChange() {}

  void _onDefaultWorkspaceChange() {}

  void _onFontSizeChange() {}

  void _onCompactViewChange() {}

  void _onAccentColorChange() {
    Utils.changeAccentColor();
  }

  void _onAutoSaveChange() {}

  void _onTaskRemindersChange() {}

  void _onTimeTrackingChange() {}

  void _onSmartSuggestionsChange() {}

  void _onDataBackupChange() {}

  void _onAnalyticsChange() {}

  void _onCrashReportsChange() {}

  String _getParameterDisplayName(String parameter) {
    switch (parameter) {
      case 'mode':
        return AppStrings.mode;
      case 'language':
        return AppStrings.language;
      case 'notifications':
        return AppStrings.notifications;
      case 'defaultWorkspace':
        return AppStrings.defaultWorkspace;
      case 'fontSize':
        return AppStrings.fontSize;
      case 'compactView':
        return AppStrings.compactView;
      case 'accentColor':
        return AppStrings.accentColor;
      case 'autoSave':
        return AppStrings.autoSave;
      case 'taskReminders':
        return AppStrings.taskReminders;
      case 'timeTracking':
        return AppStrings.timeTracking;
      case 'smartSuggestions':
        return AppStrings.smartSuggestions;
      case 'dataBackup':
        return AppStrings.dataBackup;
      case 'analytics':
        return AppStrings.analytics;
      case 'crashReports':
        return AppStrings.crashReports;
      default:
        return parameter.capitalizeFirst ?? parameter;
    }
  }

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

    _handleSettingChange(category, parameter);
    update();
  }

  void _handleSettingChange(String category, String parameter) {
    switch (category) {
      case 'general':
        switch (parameter) {
          case 'language':
            _onLanguageChange();
            break;
          case 'notifications':
            _onNotificationsChange();
            break;
          case 'defaultWorkspace':
            _onDefaultWorkspaceChange();
            break;
        }
        break;
      case 'appearance':
        switch (parameter) {
          case 'mode':
            Utils.changeTheme();
            break;
          case 'fontSize':
            _onFontSizeChange();
            break;
          case 'compactView':
            _onCompactViewChange();
            break;
          case 'accentColor':
            _onAccentColorChange();
            break;
        }
        break;
      case 'productivity':
        switch (parameter) {
          case 'autoSave':
            _onAutoSaveChange();
            break;
          case 'taskReminders':
            _onTaskRemindersChange();
            break;
          case 'timeTracking':
            _onTimeTrackingChange();
            break;
          case 'smartSuggestions':
            _onSmartSuggestionsChange();
            break;
        }
        break;
      case 'privacy':
        switch (parameter) {
          case 'dataBackup':
            _onDataBackupChange();
            break;
          case 'analytics':
            _onAnalyticsChange();
            break;
          case 'crashReports':
            _onCrashReportsChange();
            break;
        }
        break;
    }
  }

  Widget settingWidget(
      {required String type,
      required String category,
      required String parameter,
      required List options}) {
    String description = _getParameterDescription(parameter);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h(Get.context!),
        horizontal: 20.w(Get.context!),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.cardColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: _getParameterDisplayName(parameter),
                      style: TextStyles.semiBold(
                        context: Get.context!,
                        fontSize: 14,
                        color: AppColors.secondary500,
                      ),
                      height: 21.h(Get.context!),
                    ),
                    if (description.isNotEmpty) ...[
                      SizedBox(height: 4.h(Get.context!)),
                      AppText(
                        text: description,
                        style: TextStyles.regular(
                          context: Get.context!,
                          fontSize: 12,
                          color: AppColors.secondary400,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: 16.w(Get.context!)),
              Container(
                constraints: BoxConstraints(maxWidth: 400.w(Get.context!)),
                child: Wrap(
                  spacing: 12.w(Get.context!),
                  runSpacing: 8.h(Get.context!),
                  children: [
                    for (Map option in options)
                      InkWell(
                        onTap: () => changeSettings(
                            category: category,
                            parameter: parameter,
                            newValue: option),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w(Get.context!),
                            vertical: 10.h(Get.context!),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: option["name"] ==
                                      (settings[category] == null
                                          ? ""
                                          : (settings[category][parameter] ==
                                                  null)
                                              ? ""
                                              : settings[category][parameter]
                                                  ["name"])
                                  ? AppColors.primary500
                                  : AppColors.primary0,
                              border: Border.all(
                                  width: 1.5,
                                  color: option["name"] ==
                                          (settings[category] == null
                                              ? ""
                                              : (settings[category]
                                                          [parameter] ==
                                                      null)
                                                  ? ""
                                                  : settings[category]
                                                      [parameter]["name"])
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
                                  color: option["name"] ==
                                          (settings[category] == null
                                              ? ""
                                              : (settings[category]
                                                          [parameter] ==
                                                      null)
                                                  ? ""
                                                  : settings[category]
                                                      [parameter]["name"])
                                      ? AppColors.primary0
                                      : AppColors.secondary500,
                                ),
                              ),
                            ],
                          ),
                        ),
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

  String _getParameterDescription(String parameter) {
    switch (parameter) {
      case 'mode':
        return "Choose between light and dark theme";
      case 'language':
        return "Set your preferred language for the interface";
      case 'notifications':
        return "Control whether you receive app notifications";
      case 'defaultWorkspace':
        return "Choose which workspace opens by default";
      case 'fontSize':
        return "Adjust text size for better readability";
      case 'compactView':
        return "Use condensed layouts to fit more content";
      case 'accentColor':
        return "Pick your favorite accent color theme";
      case 'autoSave':
        return "Automatically save changes as you work";
      case 'taskReminders':
        return "Get reminded about upcoming tasks";
      case 'timeTracking':
        return "Track time spent on tasks and projects";
      case 'smartSuggestions':
        return "Get AI-powered suggestions while working";
      case 'dataBackup':
        return "Choose how often to backup your data";
      case 'analytics':
        return "Help improve the app by sharing usage data";
      case 'crashReports':
        return "Automatically send crash reports to help us fix issues";
      default:
        return "";
    }
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
