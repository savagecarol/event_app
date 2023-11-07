import 'package:event_app/model/global_variable.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  Rx<GlobalVariable> globalvariable = GlobalVariable().obs;
  changeCounter(int index) {
    globalvariable.update((val) {
      val?.counter = index;
    });
  }
}
