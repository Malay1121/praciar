import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/table_view_controller.dart';

class TableViewView extends GetView<TableViewController> {
  const TableViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableViewController>(
        init: TableViewController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('TableViewView'),
              centerTitle: true,
            ),
            body: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DragAndDropLists(
                  axis: Axis.horizontal,
                  listWidth: 150,
                  listDraggingWidth: 150,
                  // listDecoration: BoxDecoration(
                  //   color: Colors.grey[200],
                  //   borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  //   boxShadow: const <BoxShadow>[
                  //     BoxShadow(
                  //       color: Colors.black45,
                  //       spreadRadius: 3.0,
                  //       blurRadius: 6.0,
                  //       offset: Offset(2, 3),
                  //     ),
                  //   ],
                  // ),
                  listPadding: const EdgeInsets.all(8.0),
                  itemDragOnLongPress: false,
                  listDragOnLongPress: false,
                  children: controller.contents,
                  onItemReorder: controller.onItemReorder,
                  onListReorder: controller.onListReorder,
                ),
              ),
            ),
          );
        });
  }
}
