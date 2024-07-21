import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praciar/app/helper/all_imports.dart';
import 'package:praciar/app/widgets/common_button.dart';
import 'package:praciar/app/widgets/common_textfield.dart';

class TagsController extends GetxController {
  void addNewTag() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w(context),
              vertical: 32.h(context),
            ),
            width: 363.w(context),
            height: 424.h(context),
            decoration: BoxDecoration(
              color: AppColors.primary0,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                AppText(
                  text: AppStrings.addTag,
                  width: 299.w(context),
                  height: 52.h(context),
                  style: TextStyles.semiBold(
                    context: context,
                    fontSize: 24,
                    color: AppColors.secondary500,
                  ),
                ),
                SizedBox(
                  height: 36.h(context),
                ),
                CommonTextField(
                  hintText: AppStrings.tagTitle,
                  width: 299.w(context),
                  height: 43.h(context),
                ),
                SizedBox(
                  height: 24.h(context),
                ),
                InkWell(
                  onTap: () => Utils.colorPicker(
                    context,
                    AppColors.primary500,
                  ),
                  child: Container(
                    width: 299.w(context),
                    height: 43.h(context),
                    padding: EdgeInsets.symmetric(
                      horizontal: 28.w(context),
                      // vertical: 32.h(context),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary0,
                      border: Border.all(
                        color: AppColors.cardColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: 22.w(context),
                            minHeight: 22.h(context),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary500,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.cardColor,
                              width: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w(context),
                        ),
                        AppText(
                          text: "#FFFFF",
                          style: TextStyles.regular(
                            context: context,
                            fontSize: 12,
                            color: AppColors.secondary400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 36.h(context),
                ),
                CommonButton(
                  text: AppStrings.create,
                  onTap: () {},
                  width: 235.w(context),
                  height: 43.h(context),
                  backgroundColor: AppColors.primary500,
                  textColor: AppColors.primary0,
                ),
                SizedBox(
                  height: 24.h(context),
                ),
                CommonButton(
                  text: AppStrings.cancel,
                  onTap: () => Get.back(),
                  width: 235.w(context),
                  height: 43.h(context),
                  border: Border.all(
                    color: AppColors.cardColor,
                    width: 1,
                  ),
                  textColor: AppColors.secondary400,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
