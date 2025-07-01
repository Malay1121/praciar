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
    List taskList = await DatabaseHelper.getTaskList();
    List<CalendarEventData> events = [];
    for (var task in taskList) {
      if (Utils.getKey(task, ["start_date"], null) != null &&
          Utils.getKey(task, ["due_dateate"], null) != null) {
        DateTime startDate = Utils.getKey(task, ["start_date"], null);
        DateTime endDate = Utils.getKey(task, ["due_date"], null);
        String title = Utils.getKey(task, ["title"], "");
        String description = Utils.getKey(task, ["description"], "");
        String id = Utils.getKey(task, ["id"], "");

        CalendarEventData event = CalendarEventData(
          event: id,
          title: title,
          description: description,
          date: startDate,
          startTime: startDate,
          endTime: endDate,
          color: AppColors.primary500,
        );
        events.add(event);
      }
    }
    eventController.addAll(events);
    update();
  }
}
