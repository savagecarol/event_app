import 'package:connect/model/message.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessageBox extends StatelessWidget {
  final Message message;
  const CustomMessageBox(
    {super.key,
     required this.message
    });

  @override
  Widget build(BuildContext context) {
    Radius r = Radius.circular(8.r);
    return (message.isLeft)? 
    Container(
        margin: EdgeInsets.only(bottom: 4.h , top: 4.h , left: 16.w , right: 64.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.accentRed,
                      borderRadius: BorderRadius.only(bottomRight: r ,
                      topRight: r,
                      topLeft: r,),
                     ),
                  child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 16),
                    child: customBlackText(message.message, 14.h , fontWeight: FontWeight.w500)
                    
                  ),
                ),
              ),
               Container(
                margin: const EdgeInsets.only(left: 4),
                 child:  customBlackText((showTime(message.time))  , 10.h ,  fontWeight: FontWeight.w600),

             
            ),
            ],
          ),
        ],
      ),
    ):
    Container(
        margin: const EdgeInsets.only(bottom: 4 , top: 4 , left: 64 , right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        if(message.isSeen) 
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: const Icon(Icons.check , size: 16, color: Colors.teal)),
          Container(
              margin: const EdgeInsets.only(right: 4),
            child:  customBlackText((showTime(message.time))  , 10.h ,  fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.grey1,
                  borderRadius: BorderRadius.only(bottomLeft: r ,
                  topRight: r,
                  topLeft: r,),
                 ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 16),
                child: customBlackText(message.message, 14.h , fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
