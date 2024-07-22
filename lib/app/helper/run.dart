import "package:get/get.dart";

import "all_imports.dart";

dynamic run(dynamic task) {
  try {
    return task();
  } catch (e, stack) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Oops!'),
        backgroundColor: AppColors.cardColor,
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: TextStyle(
                color: AppColors.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
