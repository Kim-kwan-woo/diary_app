import 'package:diary_app/controller/auth_controller.dart';
import 'package:diary_app/controller/diary_detail_controller.dart';
import 'package:diary_app/controller/login_controller.dart';
import 'package:diary_app/controller/main_controller.dart';
import 'package:diary_app/controller/note_add_controller.dart';
import 'package:diary_app/controller/note_detail_controller.dart';
import 'package:diary_app/controller/signup_controller.dart';
import 'package:diary_app/firebase_options.dart';
import 'package:diary_app/util/app_pages.dart';
import 'package:diary_app/view/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); //스플래시 화면 설정
  //파이어베이스 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DiaryApp());
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SignupController(), fenix: true);
        Get.lazyPut(() => MainController(), fenix: true);
        Get.lazyPut(() => DiaryDetailController(), fenix: true);
        Get.lazyPut(() => NoteAddController(), fenix: true);
        Get.lazyPut(() => NoteDetailController(), fenix: true);
        FlutterNativeSplash.remove(); //스플래시 화면 제거
      }),
      getPages: AppPages.pages,
      home: const LoginPage(),
    );
  }
}
