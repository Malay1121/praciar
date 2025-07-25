import 'package:get/get.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/project_dashboard/bindings/project_dashboard_binding.dart';
import '../modules/project_dashboard/views/project_dashboard_view.dart';
import '../modules/project_table_view/bindings/table_view_binding.dart';
import '../modules/project_table_view/views/project_table_view_view.dart';
import '../modules/project_tags/bindings/project_tags_binding.dart';
import '../modules/project_tags/views/project_tags_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tags/bindings/tags_binding.dart';
import '../modules/tags/views/tags_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_TABLE_VIEW,
      page: () => const ProjectTableViewView(),
      binding: TableViewBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.TAGS,
      page: () => const TagsView(),
      binding: TagsBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DASHBOARD,
      page: () => const ProjectDashboardView(),
      binding: ProjectDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_TAGS,
      page: () => const ProjectTagsView(),
      binding: ProjectTagsBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
  ];
}
