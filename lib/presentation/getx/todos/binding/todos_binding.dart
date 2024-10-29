import 'package:get/get.dart';

import '../../../../injector.dart';
import '../controller/todos_controller.dart';

class TodosBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => TodosController(injector()));
  }
}