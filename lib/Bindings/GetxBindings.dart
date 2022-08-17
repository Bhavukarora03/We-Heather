import 'package:clima/Getx/Getx_controller.dart';
import 'package:get/get.dart';


class GetxBinds extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> AuthenticationController());
    // TODO: implement dependencies
  }


}