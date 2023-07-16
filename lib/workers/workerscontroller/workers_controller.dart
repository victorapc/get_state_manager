import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkersController extends GetxController {
  final _workers = <Worker>[];
  final _nome = 'Victor Alexandre'.obs;

  String get nome => _nome.value;

  @override
  void onInit() {
    // Executa sempre que faz interação com a variável observada, como um exemplo
    // fazer um sistema de busca.
    /*final everWorker = ever(
      _nome,
      (nome) {
        debugPrint('Executando o worker ever: $nome');
      },
      // Cancela o worker caso aconteça algum erro.
      cancelOnError: true,
      // Cria uma condição caso desejar, um exemplo executar qnd for maior que 5.
      condition: () => _nome.value.length > 5,
    );
    _workers.add(everWorker);*/

    // Executa sempre 1 unica vez.
    final onceWorker = once<String>(_nome, (nome) {
      debugPrint('Executando o worker ever: $nome');
    });
    _workers.add(onceWorker);

    super.onInit();
  }

  @override
  void onClose() {
    for (var worker in _workers) {
      worker();
    }
    super.onClose();
  }

  void alterarNome(String value) {
    _nome(value);
  }
}
