import 'package:get/get.dart';
import 'package:get_state_manager/state_mixin/pages/main_controller.dart';
import 'package:get_state_manager/state_mixin/repository/viacep_repository.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViacepRepository());
    Get.put(MainController(Get.find()));
  }
}
