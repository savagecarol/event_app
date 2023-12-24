import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';


class LocationService {
  LocationService._();
  factory LocationService.getInstance() => _instance;
  static final LocationService _instance = LocationService._();
  Future<Position> getLatLong() async {
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .timeout(Duration(seconds: 10), onTimeout: () {
      Fluttertoast.showToast(msg: "Error in Fetching Location");
      return Future.error("Not able to fetch Position");
    });
    return position;
  }
}
