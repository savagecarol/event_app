import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Add_Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.pinkBackground,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.offAllNamed(Urlconstants.authUrl);
          //   },
          //   icon: Icon(Icons.arrow_back , color: ColorConstants.white,),
          // ),
          title: customWhiteText("Enter Profile Details", 18.h,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorConstants.pinkBackground,
        body:  Column(
           children: [
             Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 4.0),
                            ),
                        child: customImage(
                            boxFit: BoxFit.cover,
                            isNetwork: false,
                            imageUrl: StringConstants.defaultProfileImage,
                            height: 128.h,
                            width: 128.w,
                            shape: BoxShape.circle,
                        baseContianer: Container()),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
         InkWell(
           child: customBlackText("Change Profile Photo", 16.h,
                fontWeight: FontWeight.w500),
         ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        hintText: "Enter your first Name",
                        onChange: (Value) => {},
                        initialValue: '',
                      ),

                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        hintText: "Enter your Last Name",
                        onChange: (Value) => {},
                        initialValue: '',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        icon: Icons.calendar_month,
                        isPrefixIcon: true,
                        hintText: "Date of Birth",
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
                     
                      CustomButton(
                        onTap: () {
                          Get.toNamed(Urlconstants.editTagsUrl);
                        },
                        containerColor: ColorConstants.white,
                        shadowColor: ColorConstants.white,
                        labelText: "Submit",
                        visiblepostIcon: false,
                        labelTextWeight: FontWeight.w700,
                        postIcon: Icons.arrow_forward_rounded,
                        sizelabelText: 16.sp,
                        postIconSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
             ),

                 Center(
              child: customImage(
                baseContianer: Container(),
                  boxFit: BoxFit.contain,
                  isNetwork: false,
                  imageUrl: StringConstants.appIcon2,
                  height: 96.h,
                  width: 96.w,
                  shape: BoxShape.circle),
            ),

             SizedBox(
                    height: 8.h,
                  ),


           ],
         )
        
        
        );
  }
}
