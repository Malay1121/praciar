import 'package:praciar/app/helper/all_imports.dart';

class CommonEditTextField extends StatelessWidget {
  CommonEditTextField({
    super.key,
    required this.titleController,
    required this.style,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText,
    this.textInputAction,
  });

  final TextEditingController titleController;
  TextStyle style;
  List<TextInputFormatter>? inputFormatters;
  bool? obscureText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      inputFormatters: inputFormatters,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: textInputAction,
      style: style,
      maxLines: null,
      decoration: InputDecoration(
        filled: false,
        isDense: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.cardColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
