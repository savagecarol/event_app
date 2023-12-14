import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_button.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.symmetric(vertical : 16.h ,horizontal :16.w),
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
               CustomTextButton(text: "Tags", 
                onTap: () {} ,
                 isPostIcon: true , 
                 iconSize: 18.h,),
             SizedBox(
                height: 16.h,
              ),
                CustomButton(         
                  onTap: () {
                  },
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