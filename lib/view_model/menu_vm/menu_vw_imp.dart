import 'package:appfood/screens/categoria.dart';
import 'package:appfood/view_model/menu_vm/menu_vm.dart';
import 'package:get/get.dart';

class MenuViewModelImp implements MenuViewModel {
  @override
  void navigateCategorias() {
    Get.to(() => CategoriaScreen());
  }

  @override
  void backToRestaurantesList() {
    Get.back(closeOverlays: true, canPop: false);
  }
}
