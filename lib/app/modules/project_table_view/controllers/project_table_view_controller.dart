import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class ProjectTableViewController extends CommonController {
  //TODO: Implement ProjectTableViewController
  List<DragAndDropList> contents = [];
  String projectId = "";

  final count = 0.obs;
  Map project = {};

  List views = [
    "Table",
    "List",
    "Gantt",
  ];
  String selectedView = "Table";

  Map viewData = {
    "Table": {
      "axis": Axis.horizontal,
      "listWidth": 328,
      "listDraggingWidth": 328,
      "listPadding": const EdgeInsets.all(8.0),
      "itemDragOnLongPress": false,
      "listDragOnLongPress": false,
    },
    "List": {
      "axis": Axis.vertical,
      "listWidth": 1124,
      "listDraggingWidth": 1124,
      "listPadding": const EdgeInsets.all(8.0),
      "itemDragOnLongPress": false,
      "listDragOnLongPress": false,
    },
  };

  void changeView(String view) {
    selectedView = view;
    update();
  }

  List<PopupMenuEntry> popupMenuButtons(Map tag) {
    return <PopupMenuEntry>[
      PopupMenuItem(
        onTap: () => null,
        // deleteTag(id: tag["id"]),
        height: 24.h(Get.context!),
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.icBin,
              width: 24.w(Get.context!),
              height: 24.h(Get.context!),
              color: AppColors.error500,
            ),
            SizedBox(
              width: 12.w(Get.context!),
            ),
            AppText(
              centered: true,
              text: AppStrings.delete,
              height: 40.h(Get.context!),
              width: 96.w(Get.context!),
              style: TextStyles.semiBold(
                context: Get.context!,
                fontSize: 12,
                color: AppColors.error500,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Future createTaskList(
      {required String name,
      required String description,
      required Color color}) async {
    await DatabaseHelper.createTaskList(
        projectId: projectId,
        workspaceId: Utils.currentWorkspace,
        data: {
          "name": name,
          "description": description,
          "color": color.toHexString().substring(2),
          "created_at": Utils.toUtc(
            DateTime.now(),
          ),
        });

    // Log the activity
    await Utils.logActivity(
      action: "created",
      entityType: "list",
      entityName: name,
      projectId: projectId,
      description: "Created list: $name",
      metadata: {
        "color": color.toHexString().substring(2),
      },
    );
  }

  void addNewTaskList({Map? tag}) {
    Color color = tag != null
        ? HexColor(Utils.getKey(tag, ["color"], "546FFF"))
        : AppColors.primary500;
    TextEditingController nameController = TextEditingController(
        text: tag != null ? Utils.getKey(tag, ["name"], "Tag Name") : "");
    TextEditingController taskDescriptionController = TextEditingController();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          child: StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w(context),
                vertical: 32.h(context),
              ),
              width: 688.w(context),
              height: 580.h(context),
              decoration: BoxDecoration(
                color: AppColors.primary0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppText(
                      text: AppStrings.newTask,
                      width: 299.w(context),
                      height: 52.h(context),
                      style: TextStyles.semiBold(
                        context: context,
                        fontSize: 24,
                        color: AppColors.secondary500,
                      ),
                    ),
                    SizedBox(
                      height: 36.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.listName,
                      width: 299.w(context),
                      height: 43.h(context),
                      controller: nameController,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.listDescription,
                      width: 299.w(context),
                      height: 43.h(context),
                      controller: taskDescriptionController,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    InkWell(
                      onTap: () async {
                        color = await Utils.colorPicker(
                          context,
                          color,
                        );
                        setState(() {});
                      },
                      child: Container(
                        width: 299.w(context),
                        height: 43.h(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w(context),
                          // vertical: 32.h(context),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary0,
                          border: Border.all(
                            color: AppColors.cardColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 22.w(context),
                                minHeight: 22.h(context),
                              ),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.cardColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w(context),
                            ),
                            AppText(
                              text: color.toHexString().substring(2),
                              style: TextStyles.regular(
                                context: context,
                                fontSize: 12,
                                color: AppColors.secondary400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36.h(context),
                    ),
                    CommonButton(
                      text: AppStrings.create,
                      onTap: () async {
                        tag != null
                            ? null
                            : await createTaskList(
                                color: color,
                                description: taskDescriptionController.text,
                                name: nameController.text,
                              );
                        initializeTab();
                        Get.back();
                      },
                      width: 235.w(context),
                      height: 43.h(context),
                      backgroundColor: AppColors.primary500,
                      textColor: AppColors.primary0,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonButton(
                      text: AppStrings.cancel,
                      onTap: () => Get.back(),
                      width: 235.w(context),
                      height: 43.h(context),
                      border: Border.all(
                        color: AppColors.cardColor,
                        width: 1,
                      ),
                      textColor: AppColors.secondary400,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  void createTask(
      {required String name,
      required String listId,
      required String description,
      required List<DateTime> duration,
      required Color color,
      String? imagePath,
      String? imageType,
      List? tags}) async {
    if (name.isEmpty) {
      Utils.showSnackbar(message: AppStrings.taskNameValidation);
      return;
    } else if (description.isEmpty) {
      Utils.showSnackbar(message: AppStrings.taskDescriptionValidation);
      return;
    } else if (duration.isEmpty) {
      Utils.showSnackbar(message: AppStrings.durationValidation);
      return;
    } else if (duration[1].isBefore(duration[0])) {
      Utils.showSnackbar(message: AppStrings.durationValidation);
      return;
    } else if (duration[1] == duration[0]) {
      Utils.showSnackbar(message: AppStrings.durationValidation);
      return;
    }
    Map data = {
      "title": name,
      "description": description,
      "created_at": Utils.toUtc(
        DateTime.now(),
      ),
      "due_date": Utils.toUtc(duration[1]),
      "start_date": Utils.toUtc(duration[0]),
      "tags": tags,
    };
    if ((imagePath ?? "").isNotEmpty) {
      data.addEntries({
        "images": [
          {
            "id": "image_1",
            "type": imageType,
            "path": imagePath,
            "uploaded_at": Utils.toUtc(
              DateTime.now(),
            ),
          }
        ]
      }.entries);
    }
    await DatabaseHelper.createTask(
        projectId: projectId,
        workspaceId: Utils.currentWorkspace,
        listId: listId,
        data: data);

    // Log the activity
    await Utils.logActivity(
      action: "created",
      entityType: "task",
      entityName: name,
      projectId: projectId,
      description: "Created task: $name",
      metadata: {
        "list_id": listId,
        "start_date": Utils.toUtc(duration[0]),
        "due_date": Utils.toUtc(duration[1]),
        "tags_count": tags?.length ?? 0,
      },
    );
  }

  void addNewTask({required String listId, Map? tag}) async {
    Color color = tag != null ? HexColor(tag["color"]) : AppColors.primary500;
    TextEditingController nameController =
        TextEditingController(text: tag != null ? tag["name"] : "");
    TextEditingController taskDescriptionController = TextEditingController();
    List<DateTime>? duration;
    TextEditingController imageController = TextEditingController();
    MultiSelectController<Map> tagsController = MultiSelectController();

    List tags = await DatabaseHelper.getTaskTags(
        projectId: projectId, workspaceId: Utils.currentWorkspace);
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          child: StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w(context),
                vertical: 32.h(context),
              ),
              width: 688.w(context),
              height: 580.h(context),
              decoration: BoxDecoration(
                color: AppColors.primary0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppText(
                      text: AppStrings.newTask,
                      width: 299.w(context),
                      height: 52.h(context),
                      style: TextStyles.semiBold(
                        context: context,
                        fontSize: 24,
                        color: AppColors.secondary500,
                      ),
                    ),
                    SizedBox(
                      height: 36.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.taskName,
                      width: 299.w(context),
                      height: 43.h(context),
                      controller: nameController,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.taskDescription,
                      width: 299.w(context),
                      height: 43.h(context),
                      controller: taskDescriptionController,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    InkWell(
                      onTap: () async {
                        List<DateTime>? dateTimeList =
                            await showOmniDateTimeRangePicker(
                          context: context,
                          startInitialDate: DateTime.now(),
                          startFirstDate: DateTime(1600)
                              .subtract(const Duration(days: 3652)),
                          startLastDate: DateTime.now().add(
                            const Duration(days: 3652),
                          ),
                          endInitialDate: DateTime.now(),
                          endFirstDate: DateTime(1600)
                              .subtract(const Duration(days: 3652)),
                          endLastDate: DateTime.now().add(
                            const Duration(days: 3652),
                          ),
                          is24HourMode: false,
                          isShowSeconds: false,
                          minutesInterval: 1,
                          secondsInterval: 1,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            maxHeight: 650,
                          ),
                          transitionBuilder: (context, anim1, anim2, child) {
                            return FadeTransition(
                              opacity: anim1.drive(
                                Tween(
                                  begin: 0,
                                  end: 1,
                                ),
                              ),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 200),
                          barrierDismissible: true,
                          // selectableDayPredicate: (dateTime) {
                          //   // Disable 25th Feb 2023
                          //   if (dateTime == DateTime(2023, 2, 25)) {
                          //     return false;
                          //   } else {
                          //     return true;
                          //   }
                          // },
                        );
                        // DateTimeRange? range = await showDateRangePicker(
                        //   context: context,
                        //   firstDate:
                        //       DateTime.now().subtract(Duration(days: 9999)),
                        //   lastDate: DateTime.now().add(
                        //     Duration(days: 9999),
                        //   ),
                        //   initialDateRange: DateTimeRange(
                        //     start: DateTime.now(),
                        //     end: DateTime.now().add(Duration(days: 1)),
                        //   ),
                        //   initialEntryMode: DatePickerEntryMode.inputOnly,
                        // );
                        if (dateTimeList != null) {
                          duration = dateTimeList;
                          print(duration);
                        }
                        setState(() {});
                      },
                      child: Container(
                        width: 299.w(context),
                        height: 43.h(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w(context),
                          // vertical: 32.h(context),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary0,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.cardColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText(
                              text: duration != null
                                  ? "${Utils.formatDateTime(duration![0])} - ${Utils.formatDateTime(duration![1])}"
                                  : AppStrings.duration,
                              style: TextStyles.regular(
                                context: context,
                                fontSize: 12,
                                color: AppColors.secondary400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    InkWell(
                      onTap: () async {
                        color = await Utils.colorPicker(
                          context,
                          color,
                        );
                        setState(() {});
                      },
                      child: Container(
                        width: 299.w(context),
                        height: 43.h(context),
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w(context),
                          // vertical: 32.h(context),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary0,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.cardColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                minWidth: 22.w(context),
                                minHeight: 22.h(context),
                              ),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.cardColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w(context),
                            ),
                            AppText(
                              text: color.toHexString().substring(2),
                              style: TextStyles.regular(
                                context: context,
                                fontSize: 12,
                                color: AppColors.secondary400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonImagePicker(controller: imageController),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    SizedBox(
                      height: 43.h(context),
                      width: 299.w(context),
                      child: MultiDropdown<Map>(
                        items: tags.map<DropdownItem<Map>>(
                          (dynamic tag) {
                            return DropdownItem(
                              label: Utils.getKey(tag, ["name"], ""),
                              value: tag,
                            );
                          },
                        ).toList(),
                        controller: tagsController,
                        chipDecoration: ChipDecoration(
                          labelStyle: TextStyles.regular(
                            context: context,
                            fontSize: 12.t(context),
                            color: AppColors.primary0,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.h(context), vertical: 0.h(context)),
                          backgroundColor: AppColors.primary500,
                          deleteIcon: Icon(
                            Icons.close,
                            size: 16.t(context),
                            color: AppColors.primary0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        dropdownItemDecoration: DropdownItemDecoration(
                          textColor: AppColors.secondary900,
                          backgroundColor: AppColors.background,
                        ),
                        dropdownDecoration: DropdownDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fieldDecoration: FieldDecoration(
                          suffixIcon: Icon(
                            Icons.arrow_drop_down,
                            size: 18.t(context),
                            color: AppColors.secondary900,
                          ),
                          borderRadius: 8,
                          hintText: AppStrings.tags,
                          hintStyle: TextStyles.regular(
                            context: context,
                            fontSize: 12.t(context),
                            color: AppColors.secondary400,
                          ),
                          labelStyle: TextStyles.regular(
                            context: context,
                            fontSize: 12.t(context),
                            color: AppColors.secondary500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.cardColor,
                              width: 1,
                            ),
                          ),
                        ),
                        searchDecoration: SearchFieldDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.cardColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36.h(context),
                    ),
                    CommonButton(
                      text: AppStrings.create,
                      onTap: () async {
                        if (duration == null) {
                          Utils.showSnackbar(
                            message: AppStrings.durationValidation,
                          );
                          return;
                        }
                        if (nameController.text.isEmpty) {
                          Utils.showSnackbar(
                            message: AppStrings.taskNameValidation,
                          );
                          return;
                        }
                        if (taskDescriptionController.text.isEmpty) {
                          Utils.showSnackbar(
                            message: AppStrings.taskDescriptionValidation,
                          );
                          return;
                        }
                        String imageType = "";
                        if (imageController.text.isNotEmpty) {
                          if (await File(imageController.text).exists()) {
                            imageType = "file";
                          } else {
                            imageType = "network";
                          }
                        }

                        tag != null
                            ? null
                            : createTask(
                                color: color,
                                listId: listId,
                                description: taskDescriptionController.text,
                                duration: duration!,
                                name: nameController.text,
                                imagePath: imageController.text,
                                imageType: imageType,
                                tags: tagsController.selectedItems
                                    .map(
                                      (e) => e.value,
                                    )
                                    .toList(),
                              );
                        Get.back();
                      },
                      width: 235.w(context),
                      height: 43.h(context),
                      backgroundColor: AppColors.primary500,
                      textColor: AppColors.primary0,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonButton(
                      text: AppStrings.cancel,
                      onTap: () => Get.back(),
                      width: 235.w(context),
                      height: 43.h(context),
                      border: Border.all(
                        color: AppColors.cardColor,
                        width: 1,
                      ),
                      textColor: AppColors.secondary400,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  void initializeTab() async {
    project = (await DatabaseHelper.getProject(
            projectId: projectId, workspaceId: Utils.currentWorkspace))
        .first;
    print("Card: $project");
    contents = [
      for (var table in Utils.getKey(project, ["task_list"], []))
        DragAndDropList(
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppText(
                    text: Utils.getKey(table, ["name"], ""),
                    style: TextStyles.bold(
                      context: Get.context!,
                      fontSize: 20,
                      color: HexColor(Utils.getKey(table, ["color"], "")),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h(Get.context!),
              ),
              Container(
                height: 1,
                width: 328.w(Get.context!),
                color: HexColor(Utils.getKey(table, ["color"], "")),
              ),
              SizedBox(
                height: 16.h(Get.context!),
              ),
            ],
          ),
          children: <DragAndDropItem>[
            for (var card in Utils.getKey(table, ["tasks"], []))
              DragAndDropItem(
                child: Container(
                  width: 328.w(Get.context!),
                  height: 314.h(Get.context!),
                  decoration: BoxDecoration(
                    color: AppColors.primary0,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w(Get.context!),
                    vertical: 24.h(Get.context!),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CommonImage(
                          imageUrl: Utils.getKey(card, ["image", "path"], ""),
                          width: 280.w(Get.context!),
                          height: 110.h(Get.context!),
                          fit: BoxFit.cover,
                          type: Utils.getKey(card, ["image", "type"], ""),
                        ),
                      ),
                      SizedBox(
                        height: 16.h(Get.context!),
                      ),
                      AppText(
                        text: Utils.getKey(card, ["title"], ""),
                        height: 24.h(Get.context!),
                        width: 280.w(Get.context!),
                        style: TextStyles.bold(
                          context: Get.context!,
                          fontSize: 16,
                          color: AppColors.secondary500,
                        ),
                      ),
                      SizedBox(
                        height: 16.h(Get.context!),
                      ),
                      AppText(
                        text: Utils.getKey(card, ["description"], ""),
                        // height: 24.h(Get.context!),
                        width: 280.w(Get.context!),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.regular(
                          context: Get.context!,
                          fontSize: 14,
                          color: AppColors.secondary300,
                        ),
                      ),
                      SizedBox(
                        height: 8.h(Get.context!),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (Map tag in Utils.getKey(card, ["tags"], []))
                            FutureBuilder(
                                future: DatabaseHelper.getTaskTags(
                                    workspaceId: Utils.currentWorkspace,
                                    projectId: projectId,
                                    tagId: Utils.getKey(tag, ["id"], "")),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return Container();
                                  }
                                  if (snapshot.data is! List ||
                                      (snapshot.data as List).isEmpty) {
                                    return Container();
                                  }
                                  Map tagData = (snapshot.data as List).first;

                                  return Container(
                                    height: 16.h(Get.context!),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w(Get.context!),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: HexColor(
                                          Utils.getKey(tagData, ["color"], "")),
                                    ),
                                    child: AppText(
                                      text: Utils.getKey(tagData, ["name"], ""),
                                      height: 16.h(Get.context!),
                                      style: TextStyles.medium(
                                        context: Get.context!,
                                        fontSize: 12,
                                        color: AppColors.primary0,
                                      ),
                                    ),
                                  );
                                }),
                        ],
                      ),
                      SizedBox(
                        height: 16.h(Get.context!),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.icClock,
                            width: 24.w(Get.context!),
                            height: 24.h(Get.context!),
                            color: AppColors.secondary400,
                          ),
                          SizedBox(
                            width: 8.w(Get.context!),
                          ),
                          // SizedBox(
                          //   height: 24.h(Get.context!),
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
                          //     size: 20,
                          //   ),
                          //   onPressed: () => null,
                          //   // togglePin(Utils.getKey(card, [], {})),
                          //   color: AppColors.secondary500,
                          //   splashRadius: 20,
                          //   hoverColor: AppColors.secondary500.withOpacity(0.1),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
    ];
    update();
  }

  void updateTask({
    required String projectId,
    required String taskListId,
    required String taskId,
    required String title,
    required String description,
  }) async {
    Map task = (await DatabaseHelper.getTask(
      workspaceId: Utils.currentWorkspace,
      projectId: projectId,
      taskListId: taskListId,
      taskId: taskId,
    ))
        .first;
    task["title"] = title;
    task["description"] = description;

    Map? result = await DatabaseHelper.updateTask(
        projectId: projectId,
        taskListId: taskListId,
        taskid: taskId,
        taskData: task);
    if (result != null) {
      // Log the activity
      await Utils.logActivity(
        action: "updated",
        entityType: "task",
        entityName: title,
        entityId: taskId,
        projectId: projectId,
        description: "Updated task: $title",
        metadata: {
          "list_id": taskListId,
        },
      );

      Get.back();
    }
  }

  void deleteTaskList({
    required String id,
  }) async {
    // Get the task list name before deleting
    List taskListData = await DatabaseHelper.getTaskList(
      projectId: projectId,
      workspaceId: Utils.currentWorkspace,
      taskListId: id,
    );
    String listName = "";
    if (taskListData.isNotEmpty) {
      listName = Utils.getKey(taskListData.first, ["name"], "");
    }

    await DatabaseHelper.deleteTaskList(
      projectId: projectId,
      workspaceId: Utils.currentWorkspace,
      listId: id,
    );

    // Log the activity
    await Utils.logActivity(
      action: "deleted",
      entityType: "list",
      entityName: listName,
      entityId: id,
      projectId: projectId,
      description: "Deleted list: $listName",
    );
  }

  void openTaskDetails({required String taskId, required String listId}) async {
    Map task = (await DatabaseHelper.getTask(
      workspaceId: Utils.currentWorkspace,
      projectId: projectId,
      taskListId: listId,
      taskId: taskId,
    ))
        .first;
    Map taskList = (await DatabaseHelper.getTaskList(
            projectId: projectId,
            workspaceId: Utils.currentWorkspace,
            taskListId: listId))
        .first;

    TextEditingController titleController =
        TextEditingController(text: Utils.getKey(task, ["title"], ""));
    TextEditingController descriptionController =
        TextEditingController(text: Utils.getKey(task, ["description"], ""));
    TextEditingController imageController = TextEditingController(
        text: Utils.getKey(
            task,
            [
              "image",
              ["path"]
            ],
            ""));

    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) {
              return GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: MediaQuery.of(Get.context!).size.width,
                  height: MediaQuery.of(Get.context!).size.height,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 280.w(context),
                        vertical: 100.h(context),
                      ),
                      child: GestureDetector(
                        onTap: () => null,
                        child: Container(
                          width: 875.w(context),
                          constraints: BoxConstraints(
                            minHeight: 545.h(context),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary0,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 32.w(context),
                            vertical: 32.h(context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (Utils.getKey(task, ["image"], null) == null)
                                Center(
                                    child: CommonImagePicker(
                                        controller: imageController)),
                              CommonImage(
                                imageUrl:
                                    Utils.getKey(task, ["image", "path"], ""),
                                borderRadius: BorderRadius.circular(10),
                                fit: BoxFit.cover,
                                type: Utils.getKey(task, ["image", "type"], ""),
                                width: 811.w(context),
                                height: 318.607143.h(context),
                              ),
                              SizedBox(
                                height: 12.h(context),
                              ),
                              CommonEditTextField(
                                titleController: titleController,
                                style: TextStyles.bold(
                                  context: Get.context!,
                                  fontSize: 20,
                                  color: AppColors.secondary500,
                                ),
                              ),
                              SizedBox(
                                height: 8.h(Get.context!),
                              ),
                              Row(
                                children: [
                                  AppText(
                                    text: AppStrings.inList,
                                    style: TextStyles.regular(
                                      context: Get.context!,
                                      fontSize: 12,
                                      color: AppColors.secondary400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w(Get.context!),
                                  ),
                                  Container(
                                    height: 14.h(Get.context!),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w(Get.context!),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: HexColor(Utils.getKey(
                                          taskList, ["color"], "546FFF")),
                                    ),
                                    child: AppText(
                                      text:
                                          Utils.getKey(taskList, ["name"], ""),
                                      height: 14.h(Get.context!),
                                      style: TextStyles.medium(
                                        context: Get.context!,
                                        fontSize: 8,
                                        color: AppColors.primary0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16.h(Get.context!),
                              ),
                              AppText(
                                text: AppStrings.tags,
                                style: TextStyles.regular(
                                  context: Get.context!,
                                  fontSize: 12,
                                  color: AppColors.secondary400,
                                ),
                              ),
                              SizedBox(
                                height: 5.h(context),
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5.w(context),
                                runSpacing: 5.h(context),
                                children: [
                                  for (Map tag
                                      in Utils.getKey(task, ["tags"], []))
                                    FutureBuilder(
                                        future: DatabaseHelper.getTaskTags(
                                            workspaceId: Utils.currentWorkspace,
                                            projectId: projectId,
                                            tagId:
                                                Utils.getKey(tag, ["id"], "")),
                                        builder: (context, snapshot) {
                                          if (snapshot.data == null ||
                                              snapshot.data.isEmpty) {
                                            return SizedBox();
                                          }
                                          Map tagData = snapshot.data.first;
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.w(Get.context!),
                                              vertical: 5.h(context),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: HexColor(Utils.getKey(
                                                  tagData,
                                                  ["color"],
                                                  "564FFF")),
                                            ),
                                            child: AppText(
                                              text: Utils.getKey(
                                                  tagData, ["name"], ""),
                                              style: TextStyles.semiBold(
                                                context: Get.context!,
                                                fontSize: 14,
                                                color: AppColors.primary0,
                                              ),
                                            ),
                                          );
                                        }),
                                ],
                              ),
                              SizedBox(
                                height: 16.h(Get.context!),
                              ),
                              AppText(
                                text: AppStrings.description,
                                style: TextStyles.regular(
                                  context: Get.context!,
                                  fontSize: 12,
                                  color: AppColors.secondary400,
                                ),
                              ),
                              SizedBox(
                                height: 5.h(context),
                              ),
                              CommonEditTextField(
                                titleController: descriptionController,
                                style: TextStyles.regular(
                                  context: Get.context!,
                                  fontSize: 16,
                                  color: AppColors.secondary500,
                                ),
                              ),
                              SizedBox(
                                height: 40.h(Get.context!),
                              ),
                              Row(
                                children: [
                                  CommonButton(
                                    text: AppStrings.saveTask,
                                    onTap: () => updateTask(
                                      projectId: projectId,
                                      taskListId:
                                          Utils.getKey(taskList, ["id"], ""),
                                      taskId: Utils.getKey(task, ["id"], ""),
                                      title: titleController.text,
                                      description: descriptionController.text,
                                    ),
                                    backgroundColor: AppColors.primary500,
                                    textColor: AppColors.primary0,
                                    fontSize: 14.t(context),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 28.w(context),
                                    ),
                                    height: 52.h(context),
                                  ),
                                  SizedBox(
                                    width: 10.w(context),
                                  ),
                                  CommonButton(
                                    text: AppStrings.cancel,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 28.w(context),
                                    ),
                                    height: 52.h(context),
                                    backgroundColor: AppColors.primary0,
                                    textColor: AppColors.primary500,
                                    border: Border.all(
                                      color: AppColors.cardColor,
                                      width: 2,
                                    ),
                                    onTap: () => Get.back(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      projectId = Utils.getKey(Get.arguments, ["projectId"], "");
      print("Project ID: $projectId");
      initializeTab();
    }
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
