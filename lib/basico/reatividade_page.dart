import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class ReatividadePage extends StatelessWidget {
  final _counter = 0.obs;

  ReatividadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Básico Reatividade Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter: '),
            Obx(
              () => Text('${_counter.value}'),
            ),
            ElevatedButtonCustom(
              text: 'Soma 1',
              onPressed: () {
                _counter.value++;
              },
            ),
          ],
        ),
      ),
    );
  }
}
