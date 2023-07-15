import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/tipos/model/aluno.dart';

class TiposReativosGenericosPage extends StatelessWidget {
  // Exemplos de Rx
  final nome = Rx<String>('Victor Alexandre');
  final isAluno = Rx<bool>(true);
  final qtdCurso = Rx<int>(1);
  final valorCurso = Rx<double>(1499.00);
  final jornadas = Rx<List<String>>([
    'Jornada GetX',
    'Jornada ADF',
  ]);
  final aluno = Rx<Map<String, dynamic>>(
      {'id': 1, 'nome': 'Victor Alexandre', 'tipo': 'Aluno'});

  final alunoModel =
      Rx<Aluno>(Aluno(id: 5, nome: 'Sophia Gomes', curso: 'Inglês'));

  TiposReativosGenericosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos Reativos Genéricos'),
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
              return Text('Id do aluno: ${aluno.value['id']}');
            }),
            Obx(() {
              debugPrint('Montando nome do aluno');
              return Text('Nome do aluno: ${aluno.value['nome']}');
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
                  children: jornadas.value.map(Text.new).toList(),
                )),
            ElevatedButtonCustom(
              text: 'Alterar Id',
              onPressed: () {
                aluno.value['id'] = 3;
                aluno.refresh();
              },
            ),
            ElevatedButtonCustom(
              text: 'Adicionar Jornada',
              onPressed: () {
                //jornadas.add('Jornada Dart');
                jornadas.value.assign('Jornada Dart');
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
