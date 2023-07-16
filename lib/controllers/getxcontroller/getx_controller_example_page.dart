import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/controllers/getxcontroller/controller_getx.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class GetxControllerExamplePage extends StatefulWidget {
  const GetxControllerExamplePage({super.key});

  @override
  State<GetxControllerExamplePage> createState() =>
      _GetxControllerExamplePageState();
}

class _GetxControllerExamplePageState extends State<GetxControllerExamplePage> {
  @override
  void dispose() {
    debugPrint('Dispose GetxControllerExamplePage');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build GetxControllerExamplePage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Controller Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(Get.find<ControllerGetx>().nome);
            }),
            ElevatedButtonCustom(
              text: 'Alterar Dados',
              onPressed: () {
                Get.find<ControllerGetx>().alterarDados();
              },
            ),
            ElevatedButtonCustom(
              text: 'Recarregar Dados',
              onPressed: () {
                Get.reload<ControllerGetx>();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
