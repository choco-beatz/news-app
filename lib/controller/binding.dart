import 'package:get/get.dart';
import 'package:kalpas_machine_test/controller/controller.dart';

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}
