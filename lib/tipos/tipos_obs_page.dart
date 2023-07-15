import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/tipos/model/aluno.dart';

class TiposObsPage extends StatelessWidget {
  // Exemplos de Rxn que é usado para tipos que podem ser nulos.
  final nome = 'Victor Alexandre'.obs;
  final isAluno = true.obs;
  final qtdCurso = 1.obs;
  final valorCurso = 1499.00.obs;
  final jornadas = [
    'Jornada GetX',
    'Jornada ADF',
  ].obs;

  final aluno = <String, dynamic>{
    'id': 1,
    'nome': 'Victor Alexandre',
    'tipo': 'Aluno'
  }.obs;

  final alunoModel = Aluno(id: 5, nome: 'Sophia Gomes', curso: 'Inglês').obs;

  TiposObsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos Obs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Aluno Map',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(() {
              debugPrint('Montando id do aluno');
              return Text('Id do aluno: ${aluno['id']}');
            }),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${aluno['nome']}');
            }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Aluno Model',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(() {
              debugPrint('Montando id do aluno');
              return Text('Id do aluno: ${alunoModel.value.id}');
            }),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${alunoModel.value.nome}');
            }),
            const SizedBox(
              height: 10,
            ),
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
            ElevatedButtonCustom(
              text: 'Alterar Aluno Model',
              onPressed: () {
                // Pode usar assim
                /*alunoModel.value =
                    Aluno(id: 8, nome: 'Sophia Lindona', curso: 'Inglês');*/
                // ou
                alunoModel(
                    Aluno(id: 8, nome: 'Sophia Lindona', curso: 'Inglês'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
