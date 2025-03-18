import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class OnboardingController extends CommonController {
  //TODO: Implement OnboardingController

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void getStarted({required String name, required String email}) async {
    await DatabaseHelper.createDatabase();
    await DatabaseHelper.createUser(name: name, email: email, role: "owner");
    Get.offAllNamed(Routes.DASHBOARD);
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
