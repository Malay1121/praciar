import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class DashboardController extends CommonController {
  //TODO: Implement DashboardController

  Widget getWeekdays(value, meta) {
    TextStyle style = TextStyles.medium(
      context: Get.context!,
      fontSize: 12,
      color: AppColors.secondary500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'S';
        break;
      case 1:
        text = 'M';
        break;
      case 2:
        text = 'T';
        break;
      case 3:
        text = 'W';
        break;
      case 4:
        text = 'T';
        break;
      case 5:
        text = 'F';
        break;
      case 6:
        text = 'S';
        break;
      default:
        return Container();
    }

    return AppText(text: text, style: style, textAlign: TextAlign.center);
  }

  Widget getProjectNumber(value, meta) {
    TextStyle style = TextStyles.medium(
      context: Get.context!,
      fontSize: 12,
      color: AppColors.secondary500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      default:
        return Container();
    }

    return AppText(text: text, style: style, textAlign: TextAlign.center);
  }

  Future<List> getUpcomingTasks() async {
    List tasks = await DatabaseHelper.getTask();
    return TaskSorter.sortByDueDate(tasks);
  }

  @override
  void onInit() {
    super.onInit();
    getUpcomingTasks();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> isProjectIdUnique(String projectId) async {
    List projects = await DatabaseHelper.getProject();
    return projects.where((element) => element["id"] == projectId).isEmpty;
  }

  Future createProject({
    required String id,
    required String name,
    required String description,
    required DateTimeRange duration,
    List? tags,
  }) async {
    Map projectTemplate = {
      "id": id,
      "name": name,
      "description": description,
      "status": "active",
      "created_at": Utils.toUtc(DateTime.now()),
      "updated_at": Utils.toUtc(DateTime.now()),
      "start_date": Utils.toUtc(duration.start),
      "end_date": Utils.toUtc(duration.end),
      "task_list": [
        {"id": "todo", "name": "TODO", "color": "FFFFF", "tasks": []}
      ],
      "tags": tags,
    };

    await DatabaseHelper.createProject(
        workspace: Utils.currentWorkspace,
        id: id,
        projectData: projectTemplate);

    // Log the activity
    await Utils.logActivity(
      action: "created",
      entityType: "project",
      entityName: name,
      entityId: id,
      description: "Created project: $name",
      metadata: {
        "start_date": Utils.toUtc(duration.start),
        "end_date": Utils.toUtc(duration.end),
        "tags_count": tags?.length ?? 0,
      },
    );

    return;
  }

  void createProjectDialog() async {
    TextEditingController projectIdController = TextEditingController();
    TextEditingController projectNameController = TextEditingController();
    TextEditingController projectDescriptionController =
        TextEditingController();
    MultiSelectController tagsController = MultiSelectController();

    DateTimeRange? duration;
    bool projectDetailsValidation() {
      if (projectIdController.text.isEmpty) {
        Utils.showSnackbar(message: AppStrings.projectIdValidation);
        return false;
      } else if (projectNameController.text.isEmpty) {
        Utils.showSnackbar(message: AppStrings.projectNameValidation);

        return false;
      } else if (projectDescriptionController.text.isEmpty) {
        Utils.showSnackbar(message: AppStrings.projectDescriptionValidation);

        return false;
      } else if (duration == null) {
        Utils.showSnackbar(message: AppStrings.projectDurationValidation);

        return false;
      } else {
        return true;
      }
    }

    List tags = await DatabaseHelper.getTags();

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
                      text: AppStrings.newProject,
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
                      hintText: AppStrings.projectId,
                      width: 299.w(context),
                      height: 43.h(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-z0-9_-]')),
                      ],
                      controller: projectIdController,
                    ),
                    FutureBuilder(
                      future: isProjectIdUnique(projectIdController.text),
                      builder: (context, snapshot) {
                        return (snapshot.data ?? true) == false
                            ? AppText(
                                text: AppStrings.projectIdIsNotUnique,
                                style: TextStyles.regular(
                                  context: context,
                                  fontSize: 12.t(context),
                                  color: AppColors.error500,
                                ),
                              )
                            : SizedBox();
                      },
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.projectName,
                      width: 299.w(context),
                      height: 43.h(context),
                      controller: projectNameController,
                    ),
                    SizedBox(
                      height: 24.h(context),
                    ),
                    CommonTextField(
                      hintText: AppStrings.projectDescription,
                      width: 299.w(context),
                      height: 43.h(context),
                      maxLines: null,
                      controller: projectDescriptionController,
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
                        if (projectDetailsValidation()) {
                          await createProject(
                            id: projectIdController.text,
                            name: projectNameController.text,
                            description: projectDescriptionController.text,
                            duration: duration!,
                            tags: tagsController.selectedItems,
                          );

                          Get.back();
                        }
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
}
