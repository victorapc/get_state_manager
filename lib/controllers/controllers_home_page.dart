import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';

class ControllersHomePage extends StatelessWidget {
  const ControllersHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controllers Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonCustom(
              text: 'GetX Controller',
              onPressed: () {
                Get.toNamed('/controllers/getxControllers');
              },
            ),
            ElevatedButtonCustom(
              text: 'Full Life Cycle',
              onPressed: () {
                Get.toNamed('/controllers/fullLifeCycleController');
              },
            ),
          ],
        ),
      ),
    );
  }
}
