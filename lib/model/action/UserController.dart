import 'package:event_app/model/User.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User> user = User(name: "").obs;

  changePhoneNumber(String? phoneNUmber) {
    user.update((val) {
      val?.phoneNumber = phoneNUmber;
    });
  }
}
