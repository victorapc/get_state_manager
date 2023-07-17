import 'package:get/get.dart';
import 'package:get_state_manager/state_mixin/model/cep_model.dart';
import 'package:get_state_manager/state_mixin/repository/viacep_repository.dart';

class MainControllerStateMixin extends GetxController
    with StateMixin<CepModel> {
  final ViacepRepository _repository;

  final _cepSearch = ''.obs;

  MainControllerStateMixin(this._repository);

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;

  @override
  void onReady() {
    change(state, status: RxStatus.empty());
  }

  Future<void> findAdress() async {
    try {
      change(state, status: RxStatus.loading());
      // Adiciona um delay de 1 segundo.
      await 1.seconds.delay();

      final cep = await _findAdressRepository();
      change(cep, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error());
    }
  }

  Future<void> findAdress2() async {
    change(state, status: RxStatus.loading());
    append(() => _findAdressRepository);
  }

  Future<CepModel> _findAdressRepository() async =>
      await _repository.getCep(_cepSearch.value);
}
