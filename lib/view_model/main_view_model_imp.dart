import 'package:appfood/firebase/restaurante_ref.dart';
import 'package:appfood/model/restaurante_model.dart';
import 'package:appfood/view_model/main_view_model.dart';

class MainViewModelImp implements MainViewModel {
  @override
  Future<List<RestauranteModel>> displayRestauranteList() {
    return getRestauranteList();
  }
}
