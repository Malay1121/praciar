import 'package:praciar/app/helper/all_imports.dart';

class CommonButton extends StatefulWidget {
  CommonButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.height = 48,
      this.width = 342,
      this.backgroundColor,
      this.textColor,
      this.hoverColor});

  String text;
  VoidCallback onTap;
  double height;
  double width;
  Color? backgroundColor;
  Color? textColor;
  Color? hoverColor;
  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onTap,
      color: widget.backgroundColor,
      hoverColor: widget.hoverColor,
      child: Center(
        child: AppText(
          text: widget.text,
          // height: 24.h(context),
          centered: true,
          style: TextStyles.medium(
            context: context,
            color: widget.textColor ?? AppColors.primary900,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
