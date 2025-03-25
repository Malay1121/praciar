import 'package:praciar/app/helper/all_imports.dart';

class CommonHeader extends StatefulWidget {
  CommonHeader({super.key, required this.title, this.width});

  String title;
  double? width;

  @override
  State<CommonHeader> createState() => _CommonHeaderState();
}

class _CommonHeaderState extends State<CommonHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 1124.w(context),
      child: Row(
        children: [
          AppText(
            text: widget.title,
            width: 252.w(context),
            height: 52.h(context),
            style: TextStyles.semiBold(
              context: context,
              fontSize: 24,
              color: AppColors.secondary500,
            ),
          ),
          Spacer(),
          Container(
            width: 52.w(context),
            height: 52.h(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.cardColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 14.h(context),
                horizontal: 14.w(context),
              ),
              child: SvgPicture.asset(
                AppImages.icNotification,
                color: AppColors.secondary300,
              ),
            ),
          ),
          SizedBox(
            width: 24.w(context),
          ),
          Container(
            width: 52.w(context),
            height: 52.h(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/52x52",
                ),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: AppColors.cardColor,
                width: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
