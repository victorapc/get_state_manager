import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_state_manager/state_mixin/model/cep_model.dart';

class ViacepRepository extends GetConnect {
  Future<CepModel> getCep(String cep) async {
    final result = await get('https://viacep.com.br/ws/$cep/json/');

    if (result.hasError) {
      log('Erro ao buscar cep.', error: result.statusText);
      throw Exception('Erro ao buscar cep');
    }

    return CepModel.fromMap(result.body);
  }
}
