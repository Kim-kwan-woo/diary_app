import 'package:diary_app/service/auth_service.dart';
import 'package:diary_app/util/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn<User>();

  Rxn<User> get user => _user;

  //회원가입
  signup(id, pw) => AuthService().signup(id, pw);

  //로그인
  login(id, pw) => AuthService().login(id, pw);

  //구글로 로그인
  signInWithGoogle() => AuthService().signInWithGoogle();

  //로그아웃
  logout() => AuthService().logout();

  //유저 프로필 사진 업로드
  uploadProfileImage(String downloadUrl) async {
    _user.value!.updatePhotoURL(downloadUrl);
  }

  @override
  void onInit() {
    super.onInit();

    FirebaseAuth.instance.authStateChanges().listen((value) {
      _user(value);
      if (value != null) {
        Get.offAllNamed(AppRoutes.main);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }
}
