import 'package:humanize_duration/humanize_duration.dart';
import 'package:intl/intl.dart';
import 'package:praciar/app/helper/local_firestore/local_firestore.dart';
import 'all_imports.dart';

class Utils {
  static bool isLocal = Platform.isWindows || Platform.isMacOS;
  static String dataPath = "";
  static WindowsNotification winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

  static String currentWorkspace = "personal";

  static Future<String> getLocalPath() async {
    return (await getApplicationSupportDirectory()).path;
  }

  static Future<String> getDataPath() async {
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

  static changeTheme() async {
    Map settings = await DatabaseHelper.getKey(location: ["settings"]);
    String type =
        settings["appearance"]["mode"]["name"].toString().toLowerCase();
    AppColors.primary900 =
        type == "dark" ? Color(0xFF040815) : Color(0xFF10197A);
    AppColors.primary800 =
        type == "dark" ? Color(0xFF060713) : Color(0xFF1A2793);
    AppColors.primary700 =
        type == "dark" ? Color(0xFF0A0A18) : Color(0xFF2A3BB7);
    AppColors.primary600 =
        type == "dark" ? Color(0xFF0E0F1D) : Color(0xFF3D53DB);
    AppColors.primary500 =
        type == "dark" ? Color(0xFF546FFF) : Color(0xFF546FFF);
    AppColors.primary400 =
        type == "dark" ? Color(0xFF54577A) : Color(0xFF9F84FD);
    AppColors.primary300 =
        type == "dark" ? Color(0xFF8E92BC) : Color(0xFF98ABFF);
    AppColors.primary200 =
        type == "dark" ? Color(0xFFC2C6E8) : Color(0xFFBAC8FF);
    AppColors.primary100 =
        type == "dark" ? Color(0xFFDFE1F3) : Color(0xFFDCE4FF);
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
    AppColors.success900 = Color(0xFF3B6506);
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
}
