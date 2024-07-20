import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praciar/app/helper/all_imports.dart';

class CommonButton extends StatefulWidget {
  CommonButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.prefix,
    this.suffix,
    this.padding,
    this.border,
  });

  String text;
  VoidCallback onTap;
  double? height;
  double? width;
  Color? backgroundColor;
  Color? textColor;
  double? fontSize;
  Widget? prefix;
  Widget? suffix;
  Border? border;
  EdgeInsetsGeometry? padding;
  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: widget.border,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.prefix != null) widget.prefix!,
            if (widget.prefix != null) SizedBox(width: 12.w(context)),
            Center(
              child: AppText(
                text: widget.text,
                // height: 24.h(context),
                centered: true,
                style: TextStyles.medium(
                  context: context,
                  color: widget.textColor ?? AppColors.primary900,
                  fontSize: widget.fontSize ?? 16.t(context),
                ),
              ),
            ),
            if (widget.suffix != null) SizedBox(width: 12.w(context)),
            if (widget.suffix != null) widget.suffix!,
          ],
        ),
      ),
    );
  }
}
