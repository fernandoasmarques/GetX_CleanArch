import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());
  }
}
