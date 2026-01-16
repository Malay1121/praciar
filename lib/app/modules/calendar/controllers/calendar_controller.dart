import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class CalendarController extends CommonController {
  EventController eventController = EventController();
  @override
  void onInit() {
    super.onInit();
    getEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getEvents() async {
    // Get all projects to have the full context
    List projectList = await DatabaseHelper.getProject();
    List<CalendarEventData> events = [];

    for (var project in projectList) {
      String projectId = Utils.getKey(project, ["id"], "");
      List taskLists = Utils.getKey(project, ["task_list"], []);

      for (var taskList in taskLists) {
        String listId = Utils.getKey(taskList, ["id"], "");
        List tasks = Utils.getKey(taskList, ["tasks"], []);

        for (var task in tasks) {
          if (Utils.getKey(task, ["start_date"], null) != null &&
              Utils.getKey(task, ["due_date"], null) != null) {
            DateTime startDate =
                Utils.fromUtc(Utils.getKey(task, ["start_date"], null));
            DateTime endDate =
                Utils.fromUtc(Utils.getKey(task, ["due_date"], null));
            String title = Utils.getKey(task, ["title"], "");
            String description = Utils.getKey(task, ["description"], "");

            Map enrichedTask = Map.from(task);
            enrichedTask["_projectId"] = projectId;
            enrichedTask["_listId"] = listId;

            CalendarEventData event = CalendarEventData(
              event: enrichedTask,
              title: title,
              description: description,
              date: endDate,
              startTime: startDate,
              endTime: endDate,
              color: AppColors.primary500,
            );
            events.add(event);
          }
        }
      }
    }
    eventController.addAll(events);
    update();
  }
}
