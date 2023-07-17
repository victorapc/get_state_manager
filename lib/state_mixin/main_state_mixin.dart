import 'package:flutter/material.dart';
import 'package:get_state_manager/core/widget/elevated_button_custom.dart';
import 'package:get_state_manager/state_mixin/widget/cep_widget.dart';

class MainStateMixin extends StatelessWidget {
  const MainStateMixin({super.key});

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
              TextFormField(),
              ElevatedButtonCustom(
                text: 'Buscar',
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              const CepWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
