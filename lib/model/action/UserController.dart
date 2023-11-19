import 'package:event_app/model/User.dart';
import 'package:get/get.dart';

// or any action on you
class UserController extends GetxController {
  Rx<User> user = User(name: "").obs; // obs ---> if your valu change we will take action
 
  changePhoneNumber(String? phoneNUmber) {
    user.update((val) {
      val?.phoneNumber = phoneNUmber;
    });
  }

}
