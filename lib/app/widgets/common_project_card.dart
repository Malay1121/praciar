import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class CommonProjectCard extends StatefulWidget {
  CommonProjectCard({
    required this.project,
  });

  Map project;
  @override
  State<CommonProjectCard> createState() => _CommonProjectCardState();
}

class _CommonProjectCardState extends State<CommonProjectCard> {
  @override
  Widget build(BuildContext context) {
    void togglePin(Map project) {
      project["pinned"] = project["pinned"] is bool ? !project["pinned"] : true;
      print(project);
      DatabaseHelper.updateProject(
          projectId: project["id"], projectData: project);
    }

    return Padding(
      padding: EdgeInsets.only(right: 32.w(context)),
      child: InkWell(
        onTap: () => Get.toNamed(Routes.PROJECT_DASHBOARD, arguments: {
          "projectId": Utils.getKey(widget.project, ["id"], "")
        }),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 328.w(context),
          decoration: BoxDecoration(
            color: AppColors.primary0,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w(context),
            vertical: 24.h(context),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CommonImage(
                  imageUrl: Utils.getKey(widget.project, ["image", "path"], ""),
                  width: 280.w(context),
                  height: 110.h(context),
                  fit: BoxFit.cover,
                  type: Utils.getKey(widget.project, ["image", "type"], ""),
                ),
              ),
              SizedBox(
                height: 16.h(context),
              ),
              AppText(
                text: Utils.getKey(widget.project, ["name"], ""),
                height: 24.h(context),
                width: 280.w(context),
                style: TextStyles.semiBold(
                  context: context,
                  fontSize: 16,
                  color: AppColors.secondary500,
                ),
              ),
              SizedBox(
                height: 4.h(context),
              ),
              SizedBox(
                width: 280.w(context),
                height: 16.h(context),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w(context),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Utils.getKey(widget.project, ["status"], "") ==
                                  "active"
                              ? AppColors.success500
                              : AppColors.error500,
                        ),
                        child: AppText(
                          text: Utils.getKey(widget.project, ["status"], ""),
                          height: 16.h(context),
                          style: TextStyles.medium(
                            context: context,
                            fontSize: 12,
                            color: AppColors.primary0,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  StreamBuilder(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return AppText(
                          text:
                              "${Utils.formatDateTimeDifference(DateTime.now(), Utils.fromUtc(Utils.getKey(widget.project, [
                                    "end_date"
                                  ], "")))} ${AppStrings.left}",
                          height: 24.h(context),
                          style: TextStyles.medium(
                            context: context,
                            fontSize: 16.t(context),
                            color: AppColors.secondary500,
                          ),
                        );
                      }),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Utils.getKey(widget.project, ["pinned"], false) == true
                          ? Icons.star
                          : Icons.star_border_outlined,
                      size: 20.t(context),
                    ),
                    onPressed: () =>
                        togglePin(Utils.getKey(widget.project, [], {})),
                    color: AppColors.secondary500,
                    splashRadius: 20.t(context),
                    hoverColor: AppColors.secondary500.withOpacity(0.1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
