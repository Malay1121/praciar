import 'package:praciar/app/helper/all_imports.dart';

class CommonImage extends StatefulWidget {
  CommonImage({
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.fit,
    this.type = "network",
  });
  String imageUrl;
  double width;
  double height;
  BoxFit? fit;
  String type;

  @override
  State<CommonImage> createState() => _CommonImageState();
}

class _CommonImageState extends State<CommonImage> {
  @override
  Widget build(BuildContext context) {
    (widget.imageUrl) == ""
        ? widget.imageUrl = "assets/images/placeholder.png"
        : widget.imageUrl = widget.imageUrl;
    return widget.type == "network"
        ? CachedNetworkImage(
            imageUrl: widget.imageUrl,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            progressIndicatorBuilder: (context, url, progress) =>
                CircularProgressIndicator(
              color: AppColors.primary500,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error_outline,
              color: AppColors.error500,
            ),
          )
        : widget.type == "asset"
            ? Image.asset(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.error_outline,
                  color: AppColors.error500,
                ),
              )
            : widget.type == "file"
                ? Image.file(
                    File(widget.imageUrl),
                    width: widget.width,
                    height: widget.height,
                    fit: widget.fit,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.error_outline,
                      color: AppColors.error500,
                    ),
                  )
                : SizedBox();
  }
}
