import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonCustom(
              text: 'Básico Reatividade',
              onPressed: () {
                Get.toNamed('/basico');
              },
            ),
            ElevatedButtonCustom(
              text: 'Tipos Reativos',
              onPressed: () {
                Get.toNamed('/tiposReativos');
              },
            ),
            ElevatedButtonCustom(
              text: 'Tipos Reativos Genéricos',
              onPressed: () {
                Get.toNamed('/tiposReativosGenericos');
              },
            ),
            ElevatedButtonCustom(
              text: 'Tipos Reativos Genéricos Nulos',
              onPressed: () {
                Get.toNamed('/tiposReativosGenericosNulos');
              },
            ),
          ],
        ),
      ),
    );
  }
}
