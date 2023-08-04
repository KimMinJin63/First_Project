import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/controller/auth_controller.dart';
import 'package:first_project/controller/district_controller.dart';
import 'package:first_project/controller/find_password_controller.dart';
import 'package:first_project/controller/login_controller.dart';
import 'package:first_project/controller/main_controller.dart';
import 'package:first_project/controller/signup_controller.dart';
import 'package:first_project/firebase_options.dart';
import 'package:first_project/util/app_pages.dart';
import 'package:first_project/util/app_routes.dart';
import 'package:first_project/view/page/district_list_page.dart';
import 'package:first_project/view/page/login_page.dart';
import 'package:first_project/view/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => FindPasswordController(), fenix: true);
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SingupController(), fenix: true);
        Get.lazyPut(() => DistrictController(), fenix: true);
         Get.lazyPut(() => MainController(), fenix: true);
      }),
      getPages: AppPages.pages,
      initialRoute: DistrictList.route,
      theme: ThemeData(fontFamily: 'PretendardRegular'),
    );
  }
}
