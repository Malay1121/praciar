import 'package:get/get.dart';
import 'package:watcher/watcher.dart';

import '../helper/all_imports.dart';

class CommonController extends GetxController {
// Future<void> checkInternetConnection() async {
//   var connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.none) {
//     // Display a "No Internet Connection" message
//     showDialog(
//       context: Get.context!,
//       builder: (context) => AlertDialog(
//         title: Text('No Internet Connection'),
//         content: Text('Please check your internet connection and try again.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//   } else {
//     // Perform the network request
//     // ...
//   }
// }

  Map userDetails = {};
  Map data = {};
  StreamSubscription? watcher;
  void readDetails() async {
    watcher = FileWatcher(
      "${Utils.dataPath}/data.json",
    ).events.listen(
      (event) async {
        update();
      },
    );
  }

  @override
  void onInit() {
    readDetails();
// print('loll');
// checkInternetConnection();
//     userDetails = readUserDetails() ?? {};

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    watcher?.cancel();
  }
}
