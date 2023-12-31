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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButtonCustom(
                text: 'State Mixin',
                onPressed: () {
                  Get.toNamed('/mainStateMixin');
                },
              ),
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
              ElevatedButtonCustom(
                text: 'Tipos Obs',
                onPressed: () {
                  Get.toNamed('/tiposObs');
                },
              ),
              ElevatedButtonCustom(
                text: 'Atualização Objetos',
                onPressed: () {
                  Get.toNamed('/atualizacaoObjetos');
                },
              ),
              ElevatedButtonCustom(
                text: 'Controllers',
                onPressed: () {
                  Get.toNamed('/controllers');
                },
              ),
              ElevatedButtonCustom(
                text: 'GetX Widget',
                onPressed: () {
                  Get.toNamed('/getxWidget');
                },
              ),
              ElevatedButtonCustom(
                text: 'Local State Widget',
                onPressed: () {
                  Get.toNamed('/localStateWidget');
                },
              ),
              ElevatedButtonCustom(
                text: 'Workers',
                onPressed: () {
                  Get.toNamed('/workers');
                },
              ),
              ElevatedButtonCustom(
                text: 'First Rebuild',
                onPressed: () {
                  Get.toNamed('/firstRebuild');
                },
              ),
              ElevatedButtonCustom(
                text: 'Get Builder',
                onPressed: () {
                  Get.toNamed('/getBuilder');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
