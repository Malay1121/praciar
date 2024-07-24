import 'package:intl/intl.dart';

import 'all_imports.dart';

class Utils {
  static bool isLocal = Platform.isWindows || Platform.isMacOS;
  static WindowsNotification winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

  static Future<String> getLocalPath() async {
    return (await getApplicationSupportDirectory()).path;
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
}
