import 'package:get/get.dart';

import '../screens/home/bindings/home_binding.dart';
import '../screens/home/views/home_view.dart';
import '../screens/table_view/bindings/table_view_binding.dart';
import '../screens/table_view/views/table_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TABLE_VIEW,
      page: () => const TableViewView(),
      binding: TableViewBinding(),
    ),
  ];
}
