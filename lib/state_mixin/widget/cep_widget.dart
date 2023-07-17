import 'package:flutter/material.dart';

class CepWidget extends StatelessWidget {
  const CepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('CEP: '),
        Text('Cidade: '),
        Text('Rua: '),
        Text('UF: '),
      ],
    );
  }
}
