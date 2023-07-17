import 'package:get/get.dart';
import 'package:get_state_manager/state_mixin/repository/viacep_repository.dart';

class MainController extends GetxController {
  final ViacepRepository _repository;

  MainController(this._repository);
}
