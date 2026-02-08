import 'package:get/get.dart';
import 'package:humanize_duration/humanize_duration.dart';
import 'package:intl/intl.dart';
import 'package:praciar/app/helper/local_firestore/local_firestore.dart';
import 'package:praciar/app/modules/logs/controllers/logs_controller.dart';
import 'package:praciar/app/modules/project_logs/controllers/project_logs_controller.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'all_imports.dart';

class Utils {
  static bool isLocal = true;
  static String dataPath = "";
  static WindowsNotification winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

  static String currentWorkspace = "personal";

  static Future<String> getLocalPath() async {
    return (await getApplicationSupportDirectory()).path;
  }

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initializeNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final WindowsInitializationSettings initializationSettingsWindows =
        WindowsInitializationSettings(
            appName: 'Praciar',
            appUserModelId: 'Com.Malay.Praciar',
            // Search online for GUID generators to make your own
            guid: '0a1172ea-232a-4743-a712-1f2c0301477c');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux,
            windows: initializationSettingsWindows);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) => null,
    );
  }

  static scheduleNotification(Map task, DateTime endDate) async {
    Map settings = await DatabaseHelper.getSettings();
    if (getKey(settings, ["general", "notifications"], "Enabled") !=
        "Disabled") {
      tz.initializeTimeZones();
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      setLocalLocation(getLocation(currentTimeZone));
      String title = getKey(task, ["title"], "Task Notification");
      String body = getKey(task, ["description"], "Task Description");
      Duration duration =
          endDate.subtract(Duration(minutes: 10)).difference(DateTime.now());

      if (DateTime.now().isAfter(
        endDate.subtract(
          Duration(minutes: 11),
        ),
      )) {
        await flutterLocalNotificationsPlugin.show(
          0,
          title,
          body,
          NotificationDetails(
            windows: WindowsNotificationDetails(
              header: WindowsHeader(
                  id: "0",
                  title: AppStrings.inLessThan10Minutes,
                  arguments: ""),
            ),
          ),
        );
      } else {
        await flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          title,
          body,
          TZDateTime.now(getLocation(currentTimeZone)).add(duration),
          NotificationDetails(
            windows: WindowsNotificationDetails(
              header: WindowsHeader(
                  id: "0", title: AppStrings.in10Minutes, arguments: ""),
              subtitle: "subtitle",
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );
      }
    }
  }

  static dynamic getKey(Map data, List location, dynamic replacement) {
    dynamic value = data;
    for (var key in location) {
      if (value is Map || value is List) {
        value = value[key];
      } else {
        return replacement;
      }
    }
    return value ?? replacement;
  }

  static dynamic addItemToList(Map data, List location, dynamic item) {
    dynamic value = data;
    for (var key in location) {
      if (value is Map) {
        print(value.toString() + " is Map");
        value = value[key];
      } else {
        if (value is! List) {
          value = [];
        }
      }
    }
    value ??= [];
    value.add(item);
    return value;
  }

  static Future<String> getDataPath() async {
    print("${await getLocalPath()}\\data");
    return "${await getLocalPath()}\\data";
  }

  static DateTime fromUtc(String dateTime) {
    return DateTime.parse(dateTime).toLocal();
  }

  static String toUtc(DateTime dateTime) {
    return dateTime.toUtc().toString();
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat.yMMMMd().format(dateTime);
  }

  static showSnackbar({String? title, String? message}) {
    Get.snackbar(
      title ?? AppStrings.appName,
      message ?? '',
      backgroundColor: AppColors.primary500,
      colorText: AppColors.primary0,
    );
  }

  static String formatDateTimeDifference(DateTime startDateTime, endDateTime) {
    Duration difference = startDateTime.difference(endDateTime);

    return humanizeDuration(
      difference,
      options: const HumanizeOptions(spacer: " ", units: [
        Units.day,
        Units.hour,
        Units.minute,
      ]),
    );
  }

  static String greet() {
    DateTime now = DateTime.now();
    int hours = now.hour;
    String greeting = "";

    if (hours >= 1 && hours <= 12) {
      greeting = "Good Morning";
    } else if (hours >= 12 && hours <= 16) {
      greeting = "Good Afternoon";
    } else if (hours >= 16 && hours <= 21) {
      greeting = "Good Evening";
    } else if (hours >= 21 && hours <= 24) {
      greeting = "Good Night";
    }
    return greeting;
  }

  static bool compareString(String str1, String str2) {
    if (str1.toLowerCase() == str2.toLowerCase()) {
      return true;
    } else {
      return false;
    }
  }

  static String nameToId(String name, List idList) {
    String initialId = name.toString().toLowerCase().replaceAll(" ", "-");
    String originalId = initialId;
    int intId = 1;
    idList = idList
        .where(
          (element) => element.toString().startsWith(initialId),
        )
        .toList();
    while (idList.contains(initialId)) {
      initialId = originalId + intId.toString();
      intId++;
    }
    return initialId;
  }

  static Future<Color> colorPicker(
      BuildContext context, Color initialColor) async {
    Color pickerColor = initialColor;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppStrings.pickAColor,
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: initialColor,
              onColorChanged: (color) {
                pickerColor = color;
              },
            ),
            // Use Material color picker:
            //
            // child: MaterialPicker(
            //   pickerColor: pickerColor,
            //   onColorChanged: changeColor,
            //   showLabel: true, // only on portrait mode
            // ),
            //
            // Use Block color picker:
            //
            // child: BlockPicker(
            //   pickerColor: currentColor,
            //   onColorChanged: changeColor,
            // ),
            //
            // child: MultipleChoiceBlockPicker(
            //   pickerColors: currentColors,
            //   onColorsChanged: changeColors,
            // ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                AppStrings.confirm,
              ),
              onPressed: () {
                initialColor = pickerColor;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    print(initialColor.toHexString());
    return initialColor;
  }

  static changeLanguage() async {
    Map settings = await DatabaseHelper.getKey(location: ["settings"]);
    String languageCode = "english";

    if (settings["general"] != null &&
        settings["general"]["language"] != null) {
      String languageName = settings["general"]["language"]["name"].toString();
      languageCode = _getLanguageCode(languageName);
    }

    AppLocalizations.setLanguage(languageCode);
    _updateAppStrings();
  }

  static String _getLanguageCode(String languageName) {
    switch (languageName.toLowerCase()) {
      case 'english':
        return 'english';
      case 'हिंदी':
      case 'hindi':
        return 'hindi';
      case 'español':
      case 'spanish':
        return 'spanish';
      case 'français':
      case 'french':
        return 'french';
      case 'deutsch':
      case 'german':
        return 'german';
      default:
        return 'english';
    }
  }

  static _updateAppStrings() {
    AppStrings.appName = AppLocalizations.appName;
    AppStrings.letsGetYouStarted = AppLocalizations.letsGetYouStarted;
    AppStrings.getStarted = AppLocalizations.getStarted;
    AppStrings.yourName = AppLocalizations.yourName;
    AppStrings.yourEmail = AppLocalizations.yourEmail;
    AppStrings.back = AppLocalizations.back;
    AppStrings.overview = AppLocalizations.overview;
    AppStrings.task = AppLocalizations.task;
    AppStrings.settings = AppLocalizations.settings;
    AppStrings.hi = AppLocalizations.hi;
    AppStrings.letsFinishYourTaskToday =
        AppLocalizations.letsFinishYourTaskToday;
    AppStrings.activity = AppLocalizations.activity;
    AppStrings.tasks = AppLocalizations.tasks;
    AppStrings.general = AppLocalizations.general;
    AppStrings.appearance = AppLocalizations.appearance;
    AppStrings.productivity = AppLocalizations.productivity;
    AppStrings.privacy = AppLocalizations.privacy;
    AppStrings.mode = AppLocalizations.mode;
    AppStrings.language = AppLocalizations.language;
    AppStrings.notifications = AppLocalizations.notifications;
    AppStrings.defaultWorkspace = AppLocalizations.defaultWorkspace;
    AppStrings.fontSize = AppLocalizations.fontSize;
    AppStrings.compactView = AppLocalizations.compactView;
    AppStrings.accentColor = AppLocalizations.accentColor;
    AppStrings.autoSave = AppLocalizations.autoSave;
    AppStrings.taskReminders = AppLocalizations.taskReminders;
    AppStrings.timeTracking = AppLocalizations.timeTracking;
    AppStrings.smartSuggestions = AppLocalizations.smartSuggestions;
    AppStrings.dataBackup = AppLocalizations.dataBackup;
    AppStrings.analytics = AppLocalizations.analytics;
    AppStrings.crashReports = AppLocalizations.crashReports;
    AppStrings.enabled = AppLocalizations.enabled;
    AppStrings.disabled = AppLocalizations.disabled;
    AppStrings.small = AppLocalizations.small;
    AppStrings.medium = AppLocalizations.medium;
    AppStrings.large = AppLocalizations.large;
    AppStrings.blue = AppLocalizations.blue;
    AppStrings.green = AppLocalizations.green;
    AppStrings.purple = AppLocalizations.purple;
    AppStrings.red = AppLocalizations.red;
    AppStrings.personal = AppLocalizations.personal;
    AppStrings.work = AppLocalizations.work;
    AppStrings.team = AppLocalizations.team;
    AppStrings.always = AppLocalizations.always;
    AppStrings.never = AppLocalizations.never;
    AppStrings.daily = AppLocalizations.daily;
    AppStrings.weekly = AppLocalizations.weekly;
  }

  static changeAccentColor() async {
    Map settings = await DatabaseHelper.getKey(location: ["settings"]);
    String accentColor = "blue";
    String theme = "light";

    if (settings["appearance"] != null) {
      if (settings["appearance"]["accentColor"] != null) {
        accentColor = settings["appearance"]["accentColor"]["name"]
            .toString()
            .toLowerCase();
      }
      if (settings["appearance"]["mode"] != null) {
        theme = settings["appearance"]["mode"]["name"].toString().toLowerCase();
      }
    }

    _applyAccentColors(accentColor, theme);
    _applyThemeColors(theme);
    _applyStaticColors();
  }

  static _applyAccentColors(String accentColor, String theme) {
    bool isDark = theme == "dark";

    switch (accentColor) {
      case "blue":
        AppColors.primary900 = isDark ? Color(0xFF040815) : Color(0xFF10197A);
        AppColors.primary800 = isDark ? Color(0xFF060713) : Color(0xFF1A2793);
        AppColors.primary700 = isDark ? Color(0xFF0A0A18) : Color(0xFF2A3BB7);
        AppColors.primary600 = isDark ? Color(0xFF0E0F1D) : Color(0xFF3D53DB);
        AppColors.primary500 = Color(0xFF546FFF);
        AppColors.primary400 = isDark ? Color(0xFF54577A) : Color(0xFF9F84FD);
        AppColors.primary300 = isDark ? Color(0xFF8E92BC) : Color(0xFF98ABFF);
        AppColors.primary200 = isDark ? Color(0xFFC2C6E8) : Color(0xFFBAC8FF);
        AppColors.primary100 = isDark ? Color(0xFFDFE1F3) : Color(0xFFDCE4FF);
        break;
      case "green":
        AppColors.primary900 = isDark ? Color(0xFF0A1A0A) : Color(0xFF1B4A1B);
        AppColors.primary800 = isDark ? Color(0xFF0E2A0E) : Color(0xFF2D5F2D);
        AppColors.primary700 = isDark ? Color(0xFF123D12) : Color(0xFF3F743F);
        AppColors.primary600 = isDark ? Color(0xFF1A5A1A) : Color(0xFF518951);
        AppColors.primary500 = Color(0xFF22C55E);
        AppColors.primary400 = isDark ? Color(0xFF4A7A4A) : Color(0xFF6EE76E);
        AppColors.primary300 = isDark ? Color(0xFF7A9A7A) : Color(0xFF8FE58F);
        AppColors.primary200 = isDark ? Color(0xFFAABAAA) : Color(0xFFB0E3B0);
        AppColors.primary100 = isDark ? Color(0xFFD5E0D5) : Color(0xFFD1F1D1);
        break;
      case "purple":
        AppColors.primary900 = isDark ? Color(0xFF1A0A1A) : Color(0xFF4A1B4A);
        AppColors.primary800 = isDark ? Color(0xFF2A0E2A) : Color(0xFF5F2D5F);
        AppColors.primary700 = isDark ? Color(0xFF3D123D) : Color(0xFF743F74);
        AppColors.primary600 = isDark ? Color(0xFF5A1A5A) : Color(0xFF895189);
        AppColors.primary500 = Color(0xFFA855F7);
        AppColors.primary400 = isDark ? Color(0xFF7A4A7A) : Color(0xFFC476C4);
        AppColors.primary300 = isDark ? Color(0xFF9A7A9A) : Color(0xFFD997D9);
        AppColors.primary200 = isDark ? Color(0xFFBAAAAA) : Color(0xFFE6BBE6);
        AppColors.primary100 = isDark ? Color(0xFFE0D5E0) : Color(0xFFF3E8F3);
        break;
      case "red":
        AppColors.primary900 = isDark ? Color(0xFF1A0A0A) : Color(0xFF7A1A1A);
        AppColors.primary800 = isDark ? Color(0xFF2A0E0E) : Color(0xFF932B2B);
        AppColors.primary700 = isDark ? Color(0xFF3D1212) : Color(0xFFB73F3F);
        AppColors.primary600 = isDark ? Color(0xFF5A1A1A) : Color(0xFFDB5151);
        AppColors.primary500 = Color(0xFFEF4444);
        AppColors.primary400 = isDark ? Color(0xFF7A4A4A) : Color(0xFFF87171);
        AppColors.primary300 = isDark ? Color(0xFF9A7A7A) : Color(0xFFF99F9F);
        AppColors.primary200 = isDark ? Color(0xFFBAAAAA) : Color(0xFFFCBFBF);
        AppColors.primary100 = isDark ? Color(0xFFE0D5D5) : Color(0xFFFEE2E2);
        break;
    }
  }

  static changeTheme() async {
    Map settings = await DatabaseHelper.getKey(location: ["settings"]);
    String type =
        settings["appearance"]["mode"]["name"].toString().toLowerCase();
    String accentColor = "blue";

    if (settings["appearance"] != null &&
        settings["appearance"]["accentColor"] != null) {
      accentColor = settings["appearance"]["accentColor"]["name"]
          .toString()
          .toLowerCase();
    }

    _applyAccentColors(accentColor, type);
    _applyThemeColors(type);
    _applyStaticColors();
  }

  static _applyThemeColors(String type) {
    AppColors.background =
        type == "dark" ? Color(0xFF0A0A0A) : Color(0xFFFAFAFA);
    AppColors.cardColor =
        type == "dark" ? Color(0xFF050507) : Color(0xFFF5F5F7);
    AppColors.primary0 = type == "dark" ? Color(0xFF000000) : Color(0xFFFFFFFF);
    AppColors.secondary900 =
        type == "dark" ? Color(0xFF10197A) : Color(0xFF040815);
    AppColors.secondary800 =
        type == "dark" ? Color(0xFF1A2793) : Color(0xFF060713);
    AppColors.secondary700 =
        type == "dark" ? Color(0xFF2A3BB7) : Color(0xFF0A0A18);
    AppColors.secondary600 =
        type == "dark" ? Color(0xFF3D53DB) : Color(0xFF0E0F1D);
    AppColors.secondary500 =
        type == "dark" ? Color(0xFF546FFF) : Color(0xFF141522);
    AppColors.secondary400 =
        type == "dark" ? Color(0xFF9F84FD) : Color(0xFF54577A);
    AppColors.secondary300 =
        type == "dark" ? Color(0xFF98ABFF) : Color(0xFF8E92BC);
    AppColors.secondary200 =
        type == "dark" ? Color(0xFFBAC8FF) : Color(0xFFC2C6E8);
    AppColors.secondary100 =
        type == "dark" ? Color(0xFFDCE4FF) : Color(0xFFDFE1F3);
  }

  static _applyStaticColors() {
    AppColors.success800 = Color(0xFF4C7A0B);
    AppColors.success700 = Color(0xFF659711);
    AppColors.success600 = Color(0xFF7FB519);
    AppColors.success500 = Color(0xFF9CD323);
    AppColors.success400 = Color(0xFFBCE455);
    AppColors.success300 = Color(0xFFD3F178);
    AppColors.success200 = Color(0xFFE8FAA6);
    AppColors.success100 = Color(0xFFF5FCD2);
    AppColors.error900 = Color(0xFF7A0619);
    AppColors.error800 = Color(0xFF930B16);
    AppColors.error700 = Color(0xFFB71112);
    AppColors.error600 = Color(0xFFDB2719);
    AppColors.error500 = Color(0xFFFF4423);
    AppColors.error400 = Color(0xFFFF7F59);
    AppColors.error300 = Color(0xFFFFA37A);
    AppColors.error200 = Color(0xFFFFC8A6);
    AppColors.error100 = Color(0xFFFFE7D3);
    AppColors.warning900 = Color(0xFF7A4D0B);
    AppColors.warning800 = Color(0xFF936312);
    AppColors.warning700 = Color(0xFFB7821D);
    AppColors.warning600 = Color(0xFFDBA32A);
    AppColors.warning500 = Color(0xFFFFC73A);
    AppColors.warning400 = Color(0xFFFFD96B);
    AppColors.warning300 = Color(0xFFFFE488);
    AppColors.warning200 = Color(0xFFFFEFB0);
    AppColors.warning100 = Color(0xFFFFF8D7);
    AppColors.information900 = Color(0xFF102E7A);
    AppColors.information800 = Color(0xFF1A4393);
    AppColors.information700 = Color(0xFF2A60B7);
    AppColors.information600 = Color(0xFF3D81DB);
    AppColors.information500 = Color(0xFF54A6FF);
    AppColors.information400 = Color(0xFF7EC2FF);
    AppColors.information300 = Color(0xFF98D3FF);
    AppColors.information200 = Color(0xFFBAE5FF);
    AppColors.information100 = Color(0xFFDCF3FF);
  }

  static double _fontSizeMultiplier = 1.0;

  static double get fontSizeMultiplier => _fontSizeMultiplier;

  static changeFontSize() async {
    Map settings = await DatabaseHelper.getKey(location: ["settings"]);
    String fontSize = "medium";

    if (settings["appearance"] != null &&
        settings["appearance"]["fontSize"] != null) {
      fontSize =
          settings["appearance"]["fontSize"]["name"].toString().toLowerCase();
    }

    _applyFontSizeMultiplier(fontSize);
  }

  static _applyFontSizeMultiplier(String fontSize) {
    switch (fontSize) {
      case "small":
        _fontSizeMultiplier = 0.85;
        break;
      case "large":
        _fontSizeMultiplier = 1.2;
        break;
      case "medium":
      default:
        _fontSizeMultiplier = 1.0;
        break;
    }
  }

  static Future<void> logActivity({
    required String action,
    required String entityType,
    required String entityName,
    String? entityId,
    String? projectId,
    String? description,
    Map? metadata,
  }) async {
    try {
      await DatabaseHelper.createActivityLog(data: {
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "action": action, // e.g., "created", "updated", "deleted"
        "entity_type": entityType, // e.g., "project", "task", "tag", "list"
        "entity_name": entityName,
        "entity_id": entityId,
        "project_id": projectId,
        "description": description ?? "$action $entityType: $entityName",
        "metadata": metadata ?? {},
        "created_at": toUtc(DateTime.now()),
      });

      // Refresh logs controller if it's active
      if (Get.isRegistered<LogsController>()) {
        LogsController.refreshIfActive();
      }

      // Refresh project logs controller if it's active
      if (Get.isRegistered<ProjectLogsController>()) {
        ProjectLogsController.refreshIfActive();
      }
    } catch (e) {
      print("Error logging activity: $e");
    }
  }
}
