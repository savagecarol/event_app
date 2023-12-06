import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Add_Profile extends StatelessWidget {
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textFieldList = ["Name", "DOB", "Mobile", "Interests"];

    return customScaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Urlconstants.authUrl);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: customWhiteText("Enter Profile Details", 18.h,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorConstants.iconRed,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Enter your ${textFieldList[0]}",
                width: 100,
                onChange: (Value) => {},
                initialValue: '',
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 3,
                          offset: const Offset(0, 5))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextFormField(
                      controller: dateController,
                      readOnly: true,
                      // controller: GetxController(),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          dateController.text = DateFormat('dd MMMM yyyy').format(pickedDate);
                        }
                      },
                      maxLength: 10,
                      obscureText: false,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          hintText: "Enter your DOB",
                          prefixIcon: null,
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400))),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                hintText: "Enter your Mobile Number",
                width: 100,
                onChange: (Value) => {},
                initialValue: '',
                textInputType: TextInputType.phone,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButton(
                onTap: () {
                  Get.offAllNamed(Urlconstants.torchUrl);
                },
                containerColor: ColorConstants.white,
                shadowColor: ColorConstants.white,
                labelText: "Submit",
                visiblepostIcon: true,
                labelTextWeight: FontWeight.w700,
                postIcon: Icons.arrow_forward_rounded,
                sizelabelText: 24.sp,
                postIconSize: 24.sp,
              ),
              Center(
                child: customImage(
                    boxFit: BoxFit.contain,
                    isNetwork: false,
                    imageUrl: StringConstants.appIcon2,
                    height: 128.h,
                    width: 128.w,
                    shape: BoxShape.circle),
              ),
            ],
          ),
        ));
  }
}
