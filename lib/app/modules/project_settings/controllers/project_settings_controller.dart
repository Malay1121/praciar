import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';

class ProjectSettingsController extends CommonController {
  String projectId = "";
  Map project = {};

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String selectedStatus = "active";
  List<String> statusOptions = ["active", "inactive", "completed"];
  bool isLoading = false;
  bool isSaving = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      projectId = Utils.getKey(Get.arguments, ["projectId"], "");
      loadProjectData();
    }
  }

  void loadProjectData() async {
    isLoading = true;
    update();

    try {
      List projectData = await DatabaseHelper.getProject(projectId: projectId);
      if (projectData.isNotEmpty) {
        project = projectData.first;
        nameController.text = Utils.getKey(project, ["name"], "");
        descriptionController.text = Utils.getKey(project, ["description"], "");
        startDateController.text = Utils.getKey(project, ["start_date"], "");
        endDateController.text = Utils.getKey(project, ["end_date"], "");
        selectedStatus = Utils.getKey(project, ["status"], "active");
      }
    } catch (e) {
      Utils.showSnackbar(message: "Error loading project data");
    }

    isLoading = false;
    update();
  }

  void saveProject() async {
    if (nameController.text.trim().isEmpty) {
      Utils.showSnackbar(message: "Project name is required");
      return;
    }

    isSaving = true;
    update();

    try {
      Map updatedProject = Map.from(project);
      updatedProject["name"] = nameController.text.trim();
      updatedProject["description"] = descriptionController.text.trim();
      updatedProject["start_date"] = startDateController.text.trim();
      updatedProject["end_date"] = endDateController.text.trim();
      updatedProject["status"] = selectedStatus;
      updatedProject["updated_at"] = DateTime.now().toIso8601String();

      await DatabaseHelper.updateProject(
        projectId: projectId,
        projectData: updatedProject,
      );

      project = updatedProject;
      Utils.showSnackbar(message: "Project updated successfully");
    } catch (e) {
      Utils.showSnackbar(message: "Error updating project");
    }

    isSaving = false;
    update();
  }

  void selectDate(String field) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      if (field == "start_date") {
        startDateController.text = formattedDate;
      } else if (field == "end_date") {
        endDateController.text = formattedDate;
      }
      update();
    }
  }

  void deleteProject() async {
    Utils.showSnackbar(message: "Delete functionality will be available soon");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.onClose();
  }
}
