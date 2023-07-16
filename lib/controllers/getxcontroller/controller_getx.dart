import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerGetx extends GetxController {
  final _nome = 'Victor Alexandre'.obs;

  String get nome => _nome.value;

  @override
  void onInit() {
    debugPrint('onInit Controller GetX');
    super.onInit();
  }

  @override
  void onReady() {
    debugPrint('onReady Controller GetX');
    super.onReady();
  }

  @override
  void onClose() {
    debugPrint('onClose Controller GetX');
    super.onClose();
  }

  void alterarDados() {
    //nome.value = 'Victor Alexandre P. de Carvalho';
    // ou
    _nome('Victor Alexandre P. de Carvalho');
  }
}
