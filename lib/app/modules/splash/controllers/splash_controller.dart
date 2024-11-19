import 'package:get/get.dart';
import 'package:watcher/watcher.dart';

import '../../../helper/all_imports.dart';

class SplashController extends CommonController {
  //TODO: Implement SplashController
  Future<bool> checkUserExist() async {
    List users = await DatabaseHelper.getUsers();
    if (users.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> tasks() async {
    await Utils.changeTheme();
    Utils.dataPath = await Utils.getDataPath();
    return true;
  }

  void redirect() async {
    if (await checkUserExist()) {
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }

  void init() async {
    bool timeDone = false;
    bool tasksPerformed = false;
    Timer(
      Duration(seconds: 3),
      () {
        timeDone = true;
        if (tasksPerformed) {
          redirect();
        }
      },
    );
    tasksPerformed = await tasks();

    if (timeDone) {
      redirect();
    }
  }

  @override
  void onInit() {
    super.onInit();
    init();
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
