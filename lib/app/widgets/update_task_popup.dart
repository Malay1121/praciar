import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

void updateTask({
  required String projectId,
  required String taskListId,
  required String taskId,
  required String title,
  required String description,
  List? tags,
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
  task["tags"] = tags;

  Map? result = await DatabaseHelper.updateTask(
    projectId: projectId,
    taskListId: taskListId,
    taskid: taskId,
    taskData: task,
  );
  if (result != null) {
    Get.back();
  }
}

void openTaskDetails({
  required String projectId,
  required String taskId,
  required String listId,
}) async {
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

  bool addTag = false;

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

  MultiSelectController<Map> tagsController = MultiSelectController();

  List totalTags = await DatabaseHelper.getTaskTags(
      projectId: projectId, workspaceId: Utils.currentWorkspace);

  (Utils.getKey(task, ["tags"], []) as List).forEach(
    (element) {
      tagsController.selectedItems.add(DropdownItem(
        selected: true,
        label: Utils.getKey(element, ["name"], ""),
        value: element,
      ));
    },
  );

  showDialog(
    context: Get.context!,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: StatefulBuilder(
          builder: (context, setState) {
            print("hehehehe:" + totalTags.toString());

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
                              Container(
                                width: 811.w(context),
                                height: 318.607143.h(context),
                                decoration: BoxDecoration(
                                  color: AppColors.cardColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: CommonImagePicker(
                                      controller: imageController),
                                ),
                              ),
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
                                    text: Utils.getKey(taskList, ["name"], ""),
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
                                          tagId: Utils.getKey(tag, ["id"], "")),
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
                                                tagData, ["color"], "564FFF")),
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
                                if (addTag)
                                  SizedBox(
                                    height: 43.h(context),
                                    width: 299.w(context),
                                    child: MultiDropdown<Map>(
                                      items: totalTags.map<DropdownItem<Map>>(
                                        (dynamic tag) {
                                          return DropdownItem(
                                            label:
                                                Utils.getKey(tag, ["name"], ""),
                                            value: tag,
                                            selected: (Utils.getKey(
                                                    task, ["tags"], []) as List)
                                                .any(
                                              (element) =>
                                                  element['id'] == tag['id'],
                                            ),
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
                                            horizontal: 0.h(context),
                                            vertical: 0.h(context)),
                                        backgroundColor: AppColors.primary500,
                                        deleteIcon: Icon(
                                          Icons.close,
                                          size: 16.t(context),
                                          color: AppColors.primary0,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      dropdownItemDecoration:
                                          DropdownItemDecoration(
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: AppColors.cardColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      searchDecoration: SearchFieldDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            color: AppColors.cardColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        addTag = !addTag;
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.w(Get.context!),
                                      vertical: 5.h(context),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: AppColors.primary500,
                                      ),
                                    ),
                                    child: AppText(
                                      text: addTag ? "x" : "+",
                                      style: TextStyles.semiBold(
                                        context: Get.context!,
                                        fontSize: 14,
                                        color: AppColors.primary500,
                                      ),
                                    ),
                                  ),
                                ),
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
                                  onTap: () {
                                    updateTask(
                                      projectId: projectId,
                                      taskListId:
                                          Utils.getKey(taskList, ["id"], ""),
                                      taskId: Utils.getKey(task, ["id"], ""),
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      tags: tagsController.selectedItems
                                          .map(
                                            (e) => e.value,
                                          )
                                          .toList(),
                                    );
                                  },
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
