import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class TableViewController extends GetxController {
  //TODO: Implement TableViewController
  List<DragAndDropList> contents = [];

  final count = 0.obs;
  Map project = {};
  void initializeTab() async {
    project = await DatabaseHelper.getProject(project: 'Test1');
    contents = [
      //
      for (var table in project["board"]["data"])
        DragAndDropList(
          header: Text(table["name"] ?? ""),
          children: <DragAndDropItem>[
            for (var card in table["cards"])
              DragAndDropItem(
                child: GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Text(card["name"])),
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
