import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
//import 'package:get_state_manager/state_mixin/pages/main_controller.dart';
//import 'package:get_state_manager/state_mixin/pages/main_controller_state_mixin.dart';
import 'package:get_state_manager/state_mixin/pages/main_super_controller.dart';
import 'package:get_state_manager/state_mixin/widget/cep_widget.dart';
//import 'package:get_state_manager/state_mixin/widget/cep_widget.dart';

class MainStateMixin extends StatelessWidget {
  //final controller = Get.find<MainController>();
  //final controller = Get.find<MainControllerStateMixin>();
  final controller = Get.find<MainSuperController>();

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
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              ElevatedButtonCustom(
                text: 'Buscar',
                onPressed: () {
                  controller.findAdress();
                },
              ),
              ElevatedButtonCustom(
                text: 'Buscar 2',
                onPressed: () {
                  controller.findAdress2();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              controller.obx(
                (state) => CepWidget(state),
                onEmpty: const Text('Nenhum CEP encontrado na busca.'),
                onLoading: const Text('Carregando...'),
                onError: (error) => const Text(
                  'Erro ao buscar o CEP.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              /*Obx(() {
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
              }),*/
            ],
          ),
        ),
      ),
    );
  }
}
