import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/getx_widget/getx_widget_controller/getx_widget_controller.dart';

class GetxWidgetPage extends StatelessWidget {
  const GetxWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<GetxWidgetController>(
              builder: (controller) {
                return Column(
                  children: [
                    Text(controller.nome),
                    ElevatedButtonCustom(
                      text: 'Alterar Nome',
                      onPressed: () {
                        controller.alterarNome();
                      },
                    ),
                  ],
                );
              },
              // Caso do widget Getx, pode adicionar o controller pelo init, caso
              // não queira usar no init, basta adicionar no binding a dependencia do
              // controller que faz o mesmo efeito.
              init: GetxWidgetController(),
            ),
          ],
        ),
      ),
    );
  }
}
