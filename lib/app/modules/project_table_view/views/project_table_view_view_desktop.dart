import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/project_table_view/controllers/project_table_view_controller.dart';

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
                              for (String category in widget.controller.views)
                                InkWell(
                                  onTap: () => print(""),
                                  // widget.controller.changeCategory(category),
                                  child: Column(
                                    children: [
                                      AppText(
                                        width: 76.w(context),
                                        height: 21.h(context),
                                        centered: true,
                                        text: category.toString(),
                                        style: TextStyles.medium(
                                          context: context,
                                          fontSize: 14.t(context),
                                          color: category ==
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
                                        color: category ==
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
                                        color: HexColor(
                                            Utils.getKey(table, ["color"], "")),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h(context),
                                    ),
                                    Container(
                                      height: 0.5,
                                      width: 328.w(context),
                                      color: HexColor(
                                          Utils.getKey(table, ["color"], "")),
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
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            width: 328.w(context),
                                            height: 315.h(context),
                                            decoration: BoxDecoration(
                                              color: AppColors.primary0,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 24.w(context),
                                              vertical: 24.h(context),
                                            ),
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CommonImage(
                                                    imageUrl: Utils.getKey(card,
                                                        ["image", "path"], ""),
                                                    width: 280.w(context),
                                                    height: 110.h(context),
                                                    fit: BoxFit.cover,
                                                    type: Utils.getKey(card,
                                                        ["image", "type"], ""),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16.h(context),
                                                ),
                                                AppText(
                                                  text: Utils.getKey(
                                                      card, ["title"], ""),
                                                  height: 24.h(context),
                                                  width: 280.w(context),
                                                  style: TextStyles.bold(
                                                    context: context,
                                                    fontSize: 16.t(context),
                                                    color:
                                                        AppColors.secondary500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16.h(context),
                                                ),
                                                AppText(
                                                  text: Utils.getKey(card,
                                                      ["description"], ""),
                                                  // height: 24.h(context),
                                                  width: 280.w(context),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyles.regular(
                                                    context: context,
                                                    fontSize: 14.t(context),
                                                    color:
                                                        AppColors.secondary300,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8.h(context),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    for (Map tag
                                                        in Utils.getKey(
                                                            card, ["tags"], []))
                                                      FutureBuilder(
                                                          future: DatabaseHelper.getTaskTags(
                                                              workspaceId: Utils
                                                                  .currentWorkspace,
                                                              projectId: widget
                                                                  .controller
                                                                  .projectId,
                                                              tagId:
                                                                  Utils.getKey(
                                                                      tag,
                                                                      ["id"],
                                                                      "")),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot.data ==
                                                                null) {
                                                              return Container();
                                                            }
                                                            if (snapshot.data
                                                                    is! List ||
                                                                (snapshot.data
                                                                        as List)
                                                                    .isEmpty) {
                                                              return Container();
                                                            }
                                                            Map tagData =
                                                                (snapshot.data
                                                                        as List)
                                                                    .first;

                                                            return Container(
                                                              height:
                                                                  16.h(context),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 5
                                                                    .w(context),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: HexColor(
                                                                    Utils.getKey(
                                                                        tagData,
                                                                        [
                                                                          "color"
                                                                        ],
                                                                        "")),
                                                              ),
                                                              child: AppText(
                                                                text: Utils
                                                                    .getKey(
                                                                        tagData,
                                                                        [
                                                                          "name"
                                                                        ],
                                                                        ""),
                                                                height: 16
                                                                    .h(context),
                                                                style:
                                                                    TextStyles
                                                                        .medium(
                                                                  context:
                                                                      context,
                                                                  fontSize: 12,
                                                                  color: AppColors
                                                                      .primary0,
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 16.h(context),
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImages.icClock,
                                                      width: 24.w(context),
                                                      height: 24.h(context),
                                                      color: AppColors
                                                          .secondary400,
                                                    ),
                                                    SizedBox(
                                                      width: 8.w(context),
                                                    ),
                                                    // SizedBox(
                                                    //   height: 24.h(context),
                                                    //   child: StreamBuilder(
                                                    //       stream:
                                                    //           Stream.periodic(const Duration(seconds: 1)),
                                                    //       builder: (context, snapshot) {
                                                    //         return AppText(
                                                    //           text:
                                                    //               "${Utils.formatDateTimeDifference(DateTime.now(), Utils.fromUtc(Utils.getKey(card, [
                                                    //                     "due_date"
                                                    //                   ], "")))} ${AppStrings.left}",
                                                    //           height: 24.h(context),
                                                    //           style: TextStyles.medium(
                                                    //             context: context,
                                                    //             fontSize: 16.t(context),
                                                    //             color: AppColors.secondary500,
                                                    //           ),
                                                    //         );
                                                    //       }),
                                                    // ),
                                                    // Spacer(),
                                                    // IconButton(
                                                    //   icon: Icon(
                                                    //     Utils.getKey(card, ["pinned"], false) == true
                                                    //         ? Icons.star
                                                    //         : Icons.star_border_outlined,
                                                    //     size: 20.t(context),
                                                    //   ),
                                                    //   onPressed: () => null,
                                                    //   // togglePin(Utils.getKey(card, [], {})),
                                                    //   color: AppColors.secondary500,
                                                    //   splashRadius: 20.t(context),
                                                    //   hoverColor: AppColors.secondary500.withOpacity(0.1),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  DragAndDropItem(
                                      child: CommonButton(
                                        text: AppStrings.newTask,
                                        onTap: () =>
                                            widget.controller.addNewTask(),
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
                                onTap: () => null,
                                // widget.controller.addNewTag(),

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
                            axis: Axis.horizontal,
                            listWidth: 328.w(context),
                            listDraggingWidth: 328.w(context),
                            listPadding: const EdgeInsets.all(8.0),
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
