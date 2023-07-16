import 'package:get/get.dart';

class GetBuilderController extends GetxController {
  var nome = 'Victor Alexandre';
  int contador = 0;

  void alterarNome() {
    nome = 'Victor A.';
    update();
  }

  void increment() {
    contador++;
    // Irá atualizar apenas o getbuilder com o id contador.
    update(['contador']);
  }
}
