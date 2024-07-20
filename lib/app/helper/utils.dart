import 'all_imports.dart';

class Utils {
  static bool isLocal = Platform.isWindows || Platform.isMacOS;
  static WindowsNotification winNotifyPlugin = WindowsNotification(
      applicationId:
          r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

  static Future<String> getLocalPath() async {
    return (await getApplicationSupportDirectory()).path;
  }

  DateTime fromUtc(String dateTime) {
    return DateTime.parse(dateTime).toLocal();
  }

  String toUtc(DateTime dateTime) {
    return dateTime.toUtc().toString();
  }

  Color colorPicker(BuildContext context, Color initialColor) {
    Color pickerColor = initialColor;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
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
              child: const Text('Got it'),
              onPressed: () {
                initialColor = pickerColor;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return initialColor;
  }
}
