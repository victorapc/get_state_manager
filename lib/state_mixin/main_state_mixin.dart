import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/state_mixin/pages/main_controller.dart';
import 'package:get_state_manager/state_mixin/widget/cep_widget.dart';

class MainStateMixin extends StatelessWidget {
  final controller = Get.find<MainController>();

  MainStateMixin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Endereco por CEP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  controller.cepSearch = value;
                },
              ),
              ElevatedButtonCustom(
                text: 'Buscar',
                onPressed: () {
                  controller.findAdress();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return Visibility(
                  visible: controller.loading,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: controller.isError,
                  child: const Text('Erro ao buscar CEP'),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: !controller.loading && !controller.isError,
                  child: CepWidget(controller.cep),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
