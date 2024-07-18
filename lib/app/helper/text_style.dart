import 'all_imports.dart';

class TextStyles {
  static TextStyle regular({
    required BuildContext context,
    required double fontSize,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: AppStrings.fontFamily,
      fontSize: fontSize.t(context),
    );
  }

  static TextStyle medium({
    required BuildContext context,
    required double fontSize,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontFamily: AppStrings.fontFamily,
      fontSize: fontSize.t(context),
    );
  }

  static TextStyle semiBold({
    required BuildContext context,
    required double fontSize,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontFamily: AppStrings.fontFamily,
      fontSize: fontSize.t(context),
    );
  }

  static TextStyle bold({
    required BuildContext context,
    required double fontSize,
    Color color = Colors.black,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontFamily: AppStrings.fontFamily,
      fontSize: fontSize.t(context),
    );
  }
}
