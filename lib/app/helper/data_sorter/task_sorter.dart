import 'package:praciar/app/helper/all_imports.dart';

class TaskSorter {
  static List sortByDueDate(List tasks) {
    tasks.sort(
      (a, b) => Utils.fromUtc(b["due_date"].toString())
          .compareTo((Utils.fromUtc(a["due_date"].toString()))),
    );
    return tasks;
  }
}
