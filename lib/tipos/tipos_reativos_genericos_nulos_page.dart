import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/tipos/model/aluno.dart';

class TiposReativosGenericosNulosPage extends StatelessWidget {
  // Exemplos de Rxn que é usado para tipos que podem ser nulos.
  final nome = Rxn<String>('Victor Alexandre');
  final isAluno = Rxn<bool>(true);
  final qtdCurso = Rxn<int>(1);
  final valorCurso = Rxn<double>(1499.00);
  final jornadas = Rxn<List<String>>([
    'Jornada GetX',
    'Jornada ADF',
  ]);

  final aluno = Rxn<Map<String, dynamic>>(
      {'id': 1, 'nome': 'Victor Alexandre', 'tipo': 'Aluno'});

  final alunoModel =
      Rxn<Aluno>(Aluno(id: 5, nome: 'Sophia Gomes', curso: 'Inglês'));

  TiposReativosGenericosNulosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genéricos Nulos'),
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
              return Text('Id do aluno: ${aluno.value?['id']}');
            }),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${aluno.value?['nome']}');
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
              return Text('Id do aluno: ${alunoModel.value?.id}');
            }),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${alunoModel.value?.nome}');
            }),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Column(
                  children: jornadas.value?.map(Text.new).toList() ?? [],
                )),
            ElevatedButtonCustom(
              text: 'Alterar Id',
              onPressed: () {
                aluno.value?['id'] = 3;
                aluno.refresh();
              },
            ),
            ElevatedButtonCustom(
              text: 'Adicionar Jornada',
              onPressed: () {
                //jornadas.add('Jornada Dart');
                jornadas.value?.assign('Jornada Dart');
                jornadas.refresh();
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
