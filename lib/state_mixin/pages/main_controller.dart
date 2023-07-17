import 'package:get/get.dart';
import 'package:get_state_manager/state_mixin/model/cep_model.dart';
import 'package:get_state_manager/state_mixin/repository/viacep_repository.dart';

class MainController extends GetxController {
  final ViacepRepository _repository;

  final _cepSearch = ''.obs;
  final _cep = Rxn<CepModel>();
  final _loading = false.obs;
  final _error = false.obs;

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;
  CepModel? get cep => _cep.value;
  bool get loading => _loading.value;
  bool get isError => _error.value;

  MainController(this._repository);

  Future<void> findAdress() async {
    try {
      _error(false);
      _loading(true);
      final cep = await _repository.getCep(_cepSearch.value);
      _cep(cep);
    } catch (e) {
      _error(true);
    } finally {
      _loading(false);
    }
  }
}
