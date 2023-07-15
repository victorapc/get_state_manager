import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/atualizacao/model/usuario_model.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class AtualizacaoObjetosPage extends StatelessWidget {
  final usuarioModel = UsuarioModel(
          id: 32, nome: 'Victor Alexandre', email: 'victor_apc@yahoo.com.br')
      .obs;

  AtualizacaoObjetosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualização de Objetos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(usuarioModel.value.id.toString());
            }),
            Obx(() {
              return Text(usuarioModel.value.nome);
            }),
            Obx(() {
              return Text(usuarioModel.value.email);
            }),
            ElevatedButtonCustom(
              text: 'Atualizando com Refresh',
              onPressed: () {
                usuarioModel.value.nome = 'Victor A. Pereira';
                usuarioModel.refresh();
              },
            ),
            ElevatedButtonCustom(
              text: 'Atualizando com CopyWith',
              onPressed: () {
                usuarioModel.value = usuarioModel.value
                    .copyWith(nome: 'Victor A. Pereira com CopyWith');
              },
            ),
            ElevatedButtonCustom(
              text: 'Atualizando com .update ',
              onPressed: () {
                usuarioModel.update((usuario) {
                  usuario?.nome = 'Victor com .update';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
