import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kalpas_machine_test/constant/colors.dart';
import 'package:kalpas_machine_test/controller/binding.dart';
import 'package:kalpas_machine_test/controller/controller.dart';
import 'package:kalpas_machine_test/model/favs_hive_model.dart';
import 'package:kalpas_machine_test/view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Controller());
  await Hive.initFlutter();
  Hive.registerAdapter(FavsModelAdapter());
  await Hive.openBox<FavsModel>('newsBox');
  GetxBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        initialBinding: GetxBinding(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
