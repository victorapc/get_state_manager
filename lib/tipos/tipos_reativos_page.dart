import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class TiposReativosPage extends StatelessWidget {
  // Exemplos de Rx
  final nome = RxString(
      'Victor Alexandre'); //ou RxnString(), deve usar nome.value para adicionar valor.
  final isAluno = RxBool(
      true); // ou RxnBool(), deve usar isAluno.value para adicionar valor.
  final qtdCurso =
      RxInt(1); // ou RxnInt(), deve usar qtdCurso.value para adicionar valor.
  final valorCurso =
      RxnDouble(); // ou RxnDouble(), deve usar valorCurso.value para adicionar valor.
  final jornadas = RxList([
    'Jornada GetX',
    'Jornada ADF',
  ]);
  final aluno = RxMap({'id': 1, 'nome': 'Victor Alexandre', 'tipo': 'Aluno'});

  TiposReativosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos Reativos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              debugPrint('Montando id do aluno');
              return Text('Id do aluno: ${aluno['id']}');
            }),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${aluno['nome']}');
            }),
            Obx(() => Column(
                  children: jornadas.map(Text.new).toList(),
                )),
            ElevatedButtonCustom(
              text: 'Alterar Id',
              onPressed: () {
                aluno['id'] = 3;
              },
            ),
            ElevatedButtonCustom(
              text: 'Adicionar Jornada',
              onPressed: () {
                //jornadas.add('Jornada Dart');
                jornadas.assign('Jornada Dart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
