import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class CommonTaskcard extends StatefulWidget {
  CommonTaskcard({
    Key? key,
    required this.card,
    required this.listId,
    required this.projectId,
    required this.view,
  });

  Map card;
  String listId;
  String projectId;
  String view;

  @override
  State<CommonTaskcard> createState() => _CommonTaskcardState();
}

class _CommonTaskcardState extends State<CommonTaskcard> {
  void deleteTask({
    required String id,
  }) async {
    await DatabaseHelper.deleteTask(
        projectId: widget.projectId,
        workspaceId: Utils.currentWorkspace,
        listId: widget.listId,
        taskId: Utils.getKey(widget.card, ["id"], ""));
  }

  List<PopupMenuEntry> popupMenuButtons(Map task) {
    return <PopupMenuEntry>[
      PopupMenuItem(
        onTap: () => deleteTask(id: Utils.getKey(task, ["id"], "")),
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: (widget.view == "Table" ? 328 : 1124).w(context),
        height: (widget.view == "Table" ? 315 : 78).h(context),
        decoration: BoxDecoration(
          color: AppColors.primary0,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24.w(context),
          vertical: 24.h(context),
        ),
        child: widget.view == "Table"
            ? Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CommonImage(
                      imageUrl:
                          Utils.getKey(widget.card, ["image", "path"], ""),
                      width: 280.w(context),
                      height: 110.h(context),
                      fit: BoxFit.cover,
                      type: Utils.getKey(widget.card, ["image", "type"], ""),
                    ),
                  ),

                  SizedBox(
                    height: 16.h(context),
                  ),
                  AppText(
                    text: Utils.getKey(widget.card, ["title"], ""),
                    height: 24.h(context),
                    width: 280.w(context),
                    style: TextStyles.bold(
                      context: context,
                      fontSize: 16.t(context),
                      color: AppColors.secondary500,
                    ),
                  ),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (Map tag in Utils.getKey(widget.card, ["tags"], []))
                        FutureBuilder(
                            future: DatabaseHelper.getTaskTags(
                                workspaceId: Utils.currentWorkspace,
                                projectId: widget.projectId,
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
                                height: 16.h(context),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w(context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: HexColor(Utils.getKey(
                                      tagData, ["color"], "FFFFFF")),
                                ),
                                child: AppText(
                                  text: Utils.getKey(tagData, ["name"], ""),
                                  height: 16.h(context),
                                  style: TextStyles.medium(
                                    context: context,
                                    fontSize: 12,
                                    color: AppColors.primary0,
                                  ),
                                ),
                              );
                            }),
                    ],
                  ),
                  SizedBox(
                    height: 16.h(context),
                  ),
                  AppText(
                    text: Utils.getKey(widget.card, ["description"], ""),
                    // height: 24.h(context),
                    width: 280.w(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 14.t(context).floor().toDouble(),
                    style: TextStyles.regular(
                      context: context,
                      fontSize: 14.t(context),
                      color: AppColors.secondary300,
                    ),
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
                        color: AppColors.secondary400,
                      ),
                      SizedBox(
                        width: 8.w(context),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Utils.getKey(widget.card, ["image", "path"], "") == ""
                      ? Container(
                          width: 26.w(context),
                          height: 26.h(context),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(
                                Utils.getKey(widget.card, ["color"], "FFFFFF")),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CommonImage(
                            imageUrl: Utils.getKey(
                                widget.card, ["image", "path"], ""),
                            width: 26.w(context),
                            height: 26.h(context),
                            fit: BoxFit.cover,
                            type: Utils.getKey(
                                widget.card, ["image", "type"], ""),
                          ),
                        ),
                  SizedBox(
                    width: 16.w(context),
                  ),
                  AppText(
                    text: Utils.getKey(widget.card, ["title"], ""),
                    height: 24.h(context),
                    // width: 280.w(context),
                    style: TextStyles.bold(
                      context: context,
                      fontSize: 16.t(context),
                      color: AppColors.secondary500,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (Map tag in Utils.getKey(widget.card, ["tags"], []))
                        FutureBuilder(
                            future: DatabaseHelper.getTaskTags(
                                workspaceId: Utils.currentWorkspace,
                                projectId: widget.projectId,
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
                                height: 16.h(context),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w(context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: HexColor(Utils.getKey(
                                      tagData, ["color"], "FFFFFF")),
                                ),
                                child: AppText(
                                  text: Utils.getKey(tagData, ["name"], ""),
                                  height: 16.h(context),
                                  style: TextStyles.medium(
                                    context: context,
                                    fontSize: 12,
                                    color: AppColors.primary0,
                                  ),
                                ),
                              );
                            }),
                    ],
                  ),
                  SizedBox(
                    width: 16.w(context),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.icClock,
                        width: 24.w(context),
                        height: 24.h(context),
                        color: AppColors.secondary400,
                      ),
                      SizedBox(
                        width: 8.w(context),
                      ),
                      PopupMenuButton(
                        constraints: BoxConstraints(
                          minWidth: 152.w(context),
                        ),
                        padding: EdgeInsets.zero,
                        shape: Border.all(
                          color: AppColors.cardColor,
                        ),
                        shadowColor: Colors.transparent,
                        color: AppColors.primary0,
                        itemBuilder: (BuildContext context) =>
                            popupMenuButtons(widget.card),
                        child: Container(
                          width: 30.h(context),
                          height: 30.h(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primary500,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              AppImages.icMore,
                              width: 16.w(context),
                              height: 16.h(context),
                              color: AppColors.primary0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
