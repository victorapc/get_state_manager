import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/get_builder/get_builder_controller/get_builder_controller.dart';

class GetBuilderPage extends StatelessWidget {
  const GetBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Builder'),
      ),
      body: Center(
        child: GetBuilder<GetBuilderController>(builder: (controller) {
          debugPrint('GetBuilder Geral');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.nome),
              GetBuilder<GetBuilderController>(
                id: 'contador',
                builder: (controller) {
                  debugPrint('Buildando contador');
                  return Text(controller.contador.toString());
                },
              ),
              ElevatedButtonCustom(
                text: 'Alterar Nome',
                onPressed: () {
                  controller.alterarNome();
                },
              ),
              ElevatedButtonCustom(
                text: 'Alterar Contador',
                onPressed: () {
                  controller.increment();
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
