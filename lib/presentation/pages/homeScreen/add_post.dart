import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_text_button.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Title",
                  onChange: (Value) => {},
                  initialValue: '',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  hintText: "Description",
                  onChange: (Value) => {},
                  initialValue: '',
                  textInputType: TextInputType.phone,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  icon: Icons.calendar_month,
                  isPrefixIcon: true,
                  hintText: "Enter your DOB",
                  initialValue: '',
                  isEnable: false,
                  onChange: (Value) {},
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));
                    if (pickedDate != null) {
                      // dateController.text = DateFormat('dd MMMM yyyy').format(pickedDate);
                    }
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextButton(
                  text: "Tags",
                  onTap: () {
                    Get.toNamed(Urlconstants.editTagsUrl);
                  },
                  isPostIcon: true,
                  iconSize: 18.h,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  onTap: () {},
                  isLoading: false,
                  containerColor: ColorConstants.white,
                  shadowColor: ColorConstants.white,
                  labelText: "Post ",
                  visiblepostIcon: true,
                  labelTextWeight: FontWeight.w700,
                  postIcon: Icons.arrow_forward_rounded,
                  sizelabelText: 24.sp,
                  postIconSize: 24.sp,
                ),
              ],
            )));
  }
}



  //  SizedBox(
  //             child: SizedBox(
  //                 height: 700,
  //                 child: imageFiles != null ? Image.file(File(imageFiles!.path), height: 60, width: 60,) : Container(),
  //               ),
  //           ),