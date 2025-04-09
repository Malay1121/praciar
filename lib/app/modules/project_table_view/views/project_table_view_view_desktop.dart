import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/project_table_view/controllers/project_table_view_controller.dart';
import 'package:praciar/app/widgets/common_task_card.dart';

class ProjectTableViewViewDesktop extends StatefulWidget {
  ProjectTableViewViewDesktop({required this.controller});

  ProjectTableViewController controller;

  @override
  State<ProjectTableViewViewDesktop> createState() =>
      _ProjectTableViewViewDesktopState();
}

class _ProjectTableViewViewDesktopState
    extends State<ProjectTableViewViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonProjectSidebar(
            selectedTab: AppStrings.task.toLowerCase(),
            projectId: widget.controller.projectId,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 32.h(context),
                    left: 32.w(context),
                    right: 32.w(context),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary0,
                  ),
                  child: Column(
                    children: [
                      CommonHeader(
                        title: AppStrings.tasks,
                      ),
                      SizedBox(
                        height: 44.h(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            alignment: WrapAlignment.start,
                            spacing: 24.w(context),
                            children: [
                              for (String view in widget.controller.views)
                                InkWell(
                                  onTap: () =>
                                      widget.controller.changeView(view),
                                  child: Column(
                                    children: [
                                      AppText(
                                        width: 76.w(context),
                                        height: 21.h(context),
                                        centered: true,
                                        text: view.toString(),
                                        style: TextStyles.medium(
                                          context: context,
                                          fontSize: 14.t(context),
                                          color: view ==
                                                  widget.controller.selectedView
                                              ? AppColors.secondary500
                                              : AppColors.secondary300,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h(context),
                                      ),
                                      Container(
                                        width: 76.w(context),
                                        height: 2.h(context),
                                        color: view ==
                                                widget.controller.selectedView
                                            ? AppColors.primary500
                                            : AppColors.primary0,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 16.h(context),
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w(context),
                      vertical: 32.h(context),
                    ),
                    child: FutureBuilder(
                        future: DatabaseHelper.getProject(
                            projectId: widget.controller.projectId,
                            workspaceId: Utils.currentWorkspace),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Container();
                          }
                          if (snapshot.data is! List ||
                              (snapshot.data as List).isEmpty) {
                            return Container();
                          }
                          Map project = (snapshot.data as List).first;
                          List<DragAndDropListInterface> contents = [
                            for (var table
                                in Utils.getKey(project, ["task_list"], []))
                              DragAndDropList(
                                header: Column(
                                  children: [
                                    AppText(
                                      text: Utils.getKey(table, ["name"], ""),
                                      style: TextStyles.bold(
                                        context: context,
                                        fontSize: 20.t(context),
                                        color: HexColor(Utils.getKey(
                                            table, ["color"], "FFFFFF")),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h(context),
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: 328.w(context),
                                      color: HexColor(Utils.getKey(
                                          table, ["color"], "FFFFFF")),
                                    ),
                                    SizedBox(
                                      height: 16.h(context),
                                    ),
                                  ],
                                ),
                                children: <DragAndDropItem>[
                                  for (var card
                                      in Utils.getKey(table, ["tasks"], []))
                                    DragAndDropItem(
                                      canDrag: true,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 16.w(context)),
                                        child: CommonTaskcard(
                                          card: card,
                                          listId:
                                              Utils.getKey(table, ["id"], ""),
                                          projectId:
                                              widget.controller.projectId,
                                          view: widget.controller.selectedView,
                                        ),
                                      ),
                                    ),
                                  DragAndDropItem(
                                      child: CommonButton(
                                        text: AppStrings.newTask,
                                        onTap: () => widget.controller
                                            .addNewTask(
                                                listId: Utils.getKey(
                                                    table, ["id"], "")),
                                        prefix: SvgPicture.asset(
                                          AppImages.icAdd,
                                          width: 24.w(context),
                                          height: 24.h(context),
                                          color: AppColors.primary500,
                                        ),
                                        border: Border.all(
                                          color: AppColors.primary500,
                                        ),
                                        textColor: AppColors.primary500,
                                        fontSize: 14.t(context),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 28.w(context),
                                        ),
                                        height: 52.h(context),
                                        width: 328.w(context),
                                      ),
                                      canDrag: false)
                                ],
                              ),
                            DragAndDropList(
                              children: [],
                              header: CommonButton(
                                text: AppStrings.newList,
                                onTap: () => widget.controller.addNewTaskList(),
                                prefix: SvgPicture.asset(
                                  AppImages.icAdd,
                                  width: 24.w(context),
                                  height: 24.h(context),
                                  color: AppColors.primary500,
                                ),
                                border: Border.all(
                                  color: AppColors.primary500,
                                ),
                                textColor: AppColors.primary500,
                                fontSize: 14.t(context),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.w(context),
                                ),
                                height: 52.h(context),
                                width: 328.w(context),
                              ),
                              contentsWhenEmpty: SizedBox(),
                            ),
                          ];
                          onItemReorder(int oldItemIndex, int oldListIndex,
                              int newItemIndex, int newListIndex) async {
                            List taskList = project["task_list"];
                            var movedItem = taskList[oldListIndex]["tasks"]
                                .removeAt(oldItemIndex);
                            taskList[newListIndex]["tasks"]
                                .insert(newItemIndex, movedItem);
                            await DatabaseHelper.updateProject(
                                projectId: widget.controller.projectId,
                                projectData: project);
                            // var movedItem = contents[oldListIndex]
                            //     .children!
                            //     .removeAt(oldItemIndex);
                            // contents[newListIndex]
                            //     .children!
                            //     .insert(newItemIndex, movedItem);
                            widget.controller.update();
                          }

                          onListReorder(
                              int oldListIndex, int newListIndex) async {
                            List taskList = project["task_list"];
                            var movedList = taskList.removeAt(oldListIndex);
                            taskList.insert(newListIndex, movedList);
                            await DatabaseHelper.updateProject(
                                projectId: widget.controller.projectId,
                                projectData: project);
                            // var movedList = contents.removeAt(oldListIndex);
                            // contents.insert(newListIndex, movedList);
                            widget.controller.update();
                          }

                          return DragAndDropLists(
                            axis: Utils.getKey(
                                widget.controller.viewData,
                                [widget.controller.selectedView, "axis"],
                                Axis.horizontal),
                            listWidth: int.parse(Utils.getKey(
                                        widget.controller.viewData,
                                        [
                                          widget.controller.selectedView,
                                          "listWidth"
                                        ],
                                        1)
                                    .toString())
                                .w(context),
                            listDraggingWidth: int.parse(Utils.getKey(
                                        widget.controller.viewData,
                                        [
                                          widget.controller.selectedView,
                                          "listDraggingWidth"
                                        ],
                                        1)
                                    .toString())
                                .w(context),
                            listPadding: Utils.getKey(
                                widget.controller.viewData,
                                [widget.controller.selectedView, "listPadding"],
                                EdgeInsets.zero),
                            itemDragOnLongPress: false,
                            listDragOnLongPress: false,
                            children: contents,
                            onItemReorder: onItemReorder,
                            onListReorder: onListReorder,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
