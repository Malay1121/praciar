import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/modules/tags/views/tags_view_desktop.dart';

import '../controllers/tags_controller.dart';

class TagsView extends GetView<TagsController> {
  const TagsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TagsController>(
        init: TagsController(),
        builder: (controller) {
          return Responsive(
            mobile: Container(),
            tablet: Container(),
            desktop: TagsViewDesktop(
              controller: controller,
            ),
          );
        });
  }
}
