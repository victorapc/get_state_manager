import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class FirstRebuildPage extends StatefulWidget {
  const FirstRebuildPage({super.key});

  @override
  State<FirstRebuildPage> createState() => _FirstRebuildPageState();
}

class _FirstRebuildPageState extends State<FirstRebuildPage> {
  final isAluno = false.obs;

  @override
  void initState() {
    super.initState();
    // Responsável em setar o rebuild para um valor como exemplo boolean false,
    // quando pressionar o botão Set False, o worker ever não será executado,
    // nesse caso só vai ser setado com valor ao contrário que seria o true.
    isAluno.firstRebuild = false;
    ever<bool>(isAluno, (isAluno) {
      Get.snackbar('Ever', 'É aluno $isAluno',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Rebuild'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Switch(
                value: isAluno.value,
                onChanged: (_) {},
              );
            }),
            ElevatedButtonCustom(
              text: 'Set True',
              onPressed: () {
                isAluno(true);
              },
            ),
            ElevatedButtonCustom(
              text: 'Set False',
              onPressed: () {
                isAluno(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
