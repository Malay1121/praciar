import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class ProjectTableViewController extends CommonController {
  //TODO: Implement ProjectTableViewController
  List<DragAndDropList> contents = [];
  String projectId = "";

  final count = 0.obs;
  Map project = {};

  List views = ["Table", "List"];
  String selectedView = "Table";

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
                fontSize: 12.t(Get.context!),
                color: AppColors.error500,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  void createTask(
      {required String name,
      required String description,
      required DateTimeRange duration,
      required Color color}) async {}

  void addNewTask({Map? tag}) {
    Color color = tag != null ? HexColor(tag["color"]) : AppColors.primary500;
    TextEditingController nameController =
        TextEditingController(text: tag != null ? tag["name"] : "");
    TextEditingController taskIdController = TextEditingController();
    TextEditingController taskDescriptionController = TextEditingController();
    DateTimeRange? duration;
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
                        DateTimeRange? range = await showDateRangePicker(
                          context: context,
                          firstDate:
                              DateTime.now().subtract(Duration(days: 9999)),
                          lastDate: DateTime.now().add(
                            Duration(days: 9999),
                          ),
                          initialDateRange: DateTimeRange(
                            start: DateTime.now(),
                            end: DateTime.now().add(Duration(days: 1)),
                          ),
                          initialEntryMode: DatePickerEntryMode.inputOnly,
                        );
                        if (range != null) {
                          duration = range;
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
                                  ? "${Utils.formatDateTime(duration!.start)} - ${Utils.formatDateTime(duration!.end)}"
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
                      onTap: () {
                        // tag != null
                        //     ? editTag(
                        //         name: nameController.text,
                        //         color: color,
                        //         id: tag["id"])
                        //     : createTag(
                        //         color: color,
                        //         name: nameController.text,
                        //       );
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
              AppText(
                text: Utils.getKey(table, ["name"], ""),
                style: TextStyles.bold(
                  context: Get.context!,
                  fontSize: 20.t(Get.context!),
                  color: HexColor(Utils.getKey(table, ["color"], "")),
                ),
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
                          fontSize: 16.t(Get.context!),
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
                          fontSize: 14.t(Get.context!),
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
                          //     size: 20.t(Get.context!),
                          //   ),
                          //   onPressed: () => null,
                          //   // togglePin(Utils.getKey(card, [], {})),
                          //   color: AppColors.secondary500,
                          //   splashRadius: 20.t(Get.context!),
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
