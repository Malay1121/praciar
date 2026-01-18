import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class ProjectLogsController extends CommonController {
  List activityLogs = [];
  bool isLoading = true;
  String projectId = "";
  static ProjectLogsController? _instance;

  @override
  void onInit() {
    super.onInit();
    _instance = this;
    if (Get.arguments != null) {
      projectId = Utils.getKey(Get.arguments, ["projectId"], "");
      print("Project ID: $projectId");
      loadActivityLogs();
    }
  }

  @override
  void onClose() {
    _instance = null;
    super.onClose();
  }

  static void refreshIfActive() {
    _instance?.loadActivityLogs();
  }

  Future<void> loadActivityLogs() async {
    try {
      isLoading = true;
      update();

      activityLogs = await DatabaseHelper.getProjectActivityLogs(projectId);

      isLoading = false;
      update();
    } catch (e) {
      print("Error loading project activity logs: $e");
      isLoading = false;
      update();
    }
  }

  String getActionIcon(String action, String entityType) {
    switch (action.toLowerCase()) {
      case 'created':
        return AppImages.icAdd;
      case 'updated':
        return AppImages.icEdit;
      case 'deleted':
        return AppImages.icDelete;
      default:
        return AppImages.icTasks;
    }
  }

  Color getActionColor(String action) {
    switch (action.toLowerCase()) {
      case 'created':
        return AppColors.success500;
      case 'updated':
        return AppColors.warning500;
      case 'deleted':
        return AppColors.error500;
      default:
        return AppColors.information500;
    }
  }

  String getEntityTypeIcon(String entityType) {
    switch (entityType.toLowerCase()) {
      case 'project':
        return AppImages.icCategory2;
      case 'task':
        return AppImages.icTasks;
      case 'tag':
        return AppImages.icTag;
      case 'list':
        return AppImages.icList;
      default:
        return AppImages.icTasks;
    }
  }

  String formatActivityDescription(Map activity) {
    String action = Utils.getKey(activity, ["action"], "").toString();
    String entityType = Utils.getKey(activity, ["entity_type"], "").toString();
    String entityName = Utils.getKey(activity, ["entity_name"], "").toString();

    return "${action.capitalize} $entityType: $entityName";
  }

  String getRelativeTime(String createdAt) {
    DateTime activityTime = Utils.fromUtc(createdAt);
    DateTime now = DateTime.now();
    Duration difference = now.difference(activityTime);

    if (difference.inMinutes < 1) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} days ago";
    } else {
      return Utils.formatDateTime(activityTime);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
