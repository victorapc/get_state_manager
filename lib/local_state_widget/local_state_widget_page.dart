import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalStateWidgetPage extends StatelessWidget {
  const LocalStateWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local State Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Value Builder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ValueBuilder<bool?>(
              initialValue: true,
              builder: (obscureValue, updater) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: TextFormField(
                    obscureText: obscureValue!,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          updater(!obscureValue);
                        },
                        icon: obscureValue == false
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                );
              },
              onUpdate: (p0) {
                debugPrint('Alterado para $p0');
              },
              onDispose: () {
                debugPrint('Removido da árvore de widget.');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'ObxValue',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ObxValue<RxBool>((obscureData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextFormField(
                  obscureText: obscureData.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        obscureData.toggle();
                      },
                      icon: obscureData.value == false
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
              );
            }, true.obs),
          ],
        ),
      ),
    );
  }
}
