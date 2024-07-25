import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class TableViewController extends GetxController {
  //TODO: Implement TableViewController
  List<DragAndDropList> contents = [];

  final count = 0.obs;
  Map project = {};
  void initializeTab() async {
    project = (await DatabaseHelper.getProject(
            projectId: "project_1", workspaceId: "workspace_1"))
        .first;
    contents = [
      //
      for (var table in project["task_list"])
        DragAndDropList(
          header: Text(table["name"] ?? ""),
          children: <DragAndDropItem>[
            for (var card in table["tasks"])
              DragAndDropItem(
                child: GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Text(card["title"])),
              ),
          ],
        ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    initializeTab();
  }

  onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    var movedItem = contents[oldListIndex].children.removeAt(oldItemIndex);
    contents[newListIndex].children.insert(newItemIndex, movedItem);
    update();
  }

  onListReorder(int oldListIndex, int newListIndex) {
    var movedList = contents.removeAt(oldListIndex);
    contents.insert(newListIndex, movedList);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
