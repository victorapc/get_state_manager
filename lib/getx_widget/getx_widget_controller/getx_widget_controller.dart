import 'package:get/get.dart';

class GetxWidgetController extends GetxController {
  final _nome = 'Victor Alexandre'.obs;

  String get nome => _nome.value;

  void alterarNome() {
    _nome('Victor Alexandre P.');
  }
}
