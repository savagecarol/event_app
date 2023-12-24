import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  var latLong = LatLng(28.7041, 77.1025);
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Position getCurrenLocation = await locationService.getLatLong();
    latLong = LatLng(getCurrenLocation.latitude, getCurrenLocation.longitude);
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        print('Marker Tapped');
      },
      position: LatLng(getCurrenLocation.latitude, getCurrenLocation.longitude),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      backgroundColor: ColorConstants.lightRed,
      appBar: AppBar(
        backgroundColor: ColorConstants.lightRed,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstants.white,
          ),
        ),
        title: customWhiteText("Location", 18.h, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            CustomTextField(
              isPrefixIcon: true,
              icon: Icons.location_on,
              hintText: "Location",
              onChange: (Value) => {},
              initialValue: '',
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: latLong, zoom: 12.0),
                markers: Set.from(allMarkers),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButton(
              onTap: () {
                Get.back();
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
    );
  }
}
