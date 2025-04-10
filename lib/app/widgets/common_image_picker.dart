import 'package:praciar/app/helper/all_imports.dart';

class CommonImagePicker extends StatefulWidget {
  CommonImagePicker({
    required this.controller,
  });

  TextEditingController controller;

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w(context),
      child: Row(
        children: [
          CommonTextField(
            hintText: AppStrings.enterImageURL,
            width: 210.w(context),
            height: 43.h(context),
            controller: widget.controller,
          ),
          SizedBox(
            width: 10.w(context),
          ),
          CommonButton(
            text: AppStrings.chooseImage,
            height: 43.h(context),
            width: 80.w(context),
            fontSize: 14.t(context),
            textColor: AppColors.secondary900,
            backgroundColor: AppColors.primary300,
            onTap: () async {
              FilePickerResult? result =
                  await FilePicker.platform.pickFiles(type: FileType.image);

              if (result != null) {
                widget.controller.text = result.files.single.path!;
              } else {}
            },
          )
        ],
      ),
    );
  }
}
