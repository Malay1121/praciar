import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/tags/controllers/tags_controller.dart';

class TagsViewDesktop extends StatefulWidget {
  TagsViewDesktop({
    super.key,
    required this.controller,
  });
  TagsController controller;
  @override
  State<TagsViewDesktop> createState() => _TagsViewDesktopState();
}

class _TagsViewDesktopState extends State<TagsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          CommonSidebar(
            selectedTab: AppStrings.tags.toLowerCase(),
          ),
        ],
      ),
    );
  }
}
