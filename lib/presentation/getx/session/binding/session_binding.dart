import 'package:get/get.dart';

import '../../../../injector.dart';
import '../controller/session_controller.dart';

class SessionBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SessionController(injector()));
  }
}