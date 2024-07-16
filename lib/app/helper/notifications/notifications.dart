import '../all_imports.dart';

class Notifications {
  void simpleNotification({
    required String id,
    String? title,
    String? description,
    String? group,
    String? launch,
    Map<String, dynamic>? payload,
  }) async {
    NotificationMessage message = NotificationMessage.fromPluginTemplate(
        id, title ?? AppStrings.appName, description ?? "",
        group: "weather_group",
        launch: "praciar://table-view",
        payload: payload ?? {});
    Utils.winNotifyPlugin.showNotificationPluginTemplate(message);
  }
}
