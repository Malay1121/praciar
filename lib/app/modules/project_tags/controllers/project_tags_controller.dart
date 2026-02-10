import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class ProjectTagsController extends CommonController {
  String projectId = "";
  void createTag({
    required String name,
    required Color color,
  }) async {
    tags = await DatabaseHelper.createTaskTag(
        projectId: projectId,
        workspaceId: Utils.currentWorkspace,
        data: {
          "name": name,
          "color": color.toHexString().substring(2),
          "created_at": Utils.toUtc(
            DateTime.now(),
          ),
        });
    update();
  }

  void editTag({
    required String name,
    required Color color,
    required String id,
  }) async {
    tags = await DatabaseHelper.updateTaskTag(
        projectId: projectId,
        workspaceId: Utils.currentWorkspace,
        data: {
          "name": name,
          "color": color.toHexString().substring(2),
          "id": id,
        });

    update();
  }

  void deleteTag({
    required String id,
  }) async {
    tags = await DatabaseHelper.deleteTaskTag(
        projectId: projectId, workspaceId: Utils.currentWorkspace, id: id);
    update();
  }

  List<PopupMenuEntry> popupMenuButtons(Map tag) {
    return <PopupMenuEntry>[
      PopupMenuItem(
        onTap: () => deleteTag(id: tag["id"]),
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

  void addNewTag({Map? tag}) {
    Color color = tag != null ? HexColor(tag["color"]) : AppColors.primary500;
    TextEditingController nameController =
        TextEditingController(text: tag != null ? tag["name"] : "");
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
              width: 363.w(context),
              height: 424.h(context),
              decoration: BoxDecoration(
                color: AppColors.primary0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  AppText(
                    text: AppStrings.addTag,
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
                    hintText: AppStrings.tagTitle,
                    width: 299.w(context),
                    height: 43.h(context),
                    controller: nameController,
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
                      tag != null
                          ? editTag(
                              name: nameController.text,
                              color: color,
                              id: tag["id"])
                          : createTag(
                              color: color,
                              name: nameController.text,
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
            );
          }),
        );
      },
    );
  }

  List tags = [];

  void fetchTags() async {
    tags = await DatabaseHelper.getTaskTags(
        projectId: projectId, workspaceId: Utils.currentWorkspace);
    List tasks = await DatabaseHelper.getTask(projectId: projectId);
    for (Map task in tasks) {
      for (Map tag in Utils.getKey(task, ["tags"], [])) {
        int index = tags.indexWhere((element) => element["id"] == tag["id"]);

        if (index >= 0) {
          if (!(tags[index] as Map).containsKey("items")) {
            tags[index].addEntries({
              "items": 0,
            }.entries);
          }
          tags[index]["items"] += 1;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      projectId = Utils.getKey(Get.arguments, ["projectId"], "");
      fetchTags();
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (projectId.isEmpty) {
      // Get.back();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
