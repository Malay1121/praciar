// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../helper/all_imports.dart';

class CommonTextField extends StatefulWidget {
  CommonTextField({
    super.key,
    required this.hintText,
    this.height = 48,
    this.width = 480,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.controller,
    this.keyboardType,
    this.suffixIconConstraints,
    this.obscureText = false,
    this.textInputAction,
    this.maxLines = 1,
    this.inputFormatters,
  });
  String hintText;
  double? width;
  double? height;
  Widget? prefixIcon;
  Widget? suffixIcon;
  BoxConstraints? suffixIconConstraints;
  Widget? suffix;
  TextEditingController? controller;
  bool obscureText;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  int? maxLines;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  // bool listening = false;
  // SpeechToText speechToText = SpeechToText();
  // bool speechEnabled = false;

  // void initializeSpeech() async {
  //   speechEnabled = await speechToText.initialize(
  //     onError: (errorNotification) {
  //       setState(() {
  //         listening = false;
  //       });
  //     },
  //   );
  // }

  // void speak() {
  //   if (!listening) {
  //     getText();
  //   }
  // }

  // Future<String> getText() async {
  //   String result = "";
  //   setState(() {
  //     listening = true;
  //   });
  //
  //   SpeechRecognitionResult r = await speechToText.listen(
  //       listenOptions: SpeechListenOptions(listenMode: ListenMode.dictation),
  //       partialResults: false,
  //       onResult: (res) {
  //         setState(() {
  //           result = res.recognizedWords;
  //           if (widget.controller != null) widget.controller!.text += result;
  //           listening = false;
  //         });
  //       });
  //
  //   return result;
  // }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // initializeSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textAlignVertical: TextAlignVertical.center,
        maxLines: widget.maxLines,
        textInputAction: widget.textInputAction,
        style: TextStyles.regular(
          context: context,
          fontSize: 12.t(context),
          color: AppColors.secondary500,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h(context),
            horizontal: 28.w(context),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyles.regular(
            context: context,
            fontSize: 12.t(context),
            color: AppColors.secondary400,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          suffixIconConstraints: widget.suffixIconConstraints,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.cardColor,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.cardColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.cardColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.cardColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
