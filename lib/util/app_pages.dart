import 'package:diary_app/util/app_routes.dart';
import 'package:diary_app/view/page/diary_detail_page.dart';
import 'package:diary_app/view/page/login_page.dart';
import 'package:diary_app/view/page/main_page.dart';
import 'package:diary_app/view/page/note_add_page.dart';
import 'package:diary_app/view/page/note_detail_page.dart';
import 'package:diary_app/view/page/signup_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const LoginPage()), //로그인
    GetPage(name: AppRoutes.signup, page: () => const SignupPage()), //회원가입
    GetPage(name: AppRoutes.main, page: () => const MainPage()), //메인
    GetPage(
        name: AppRoutes.diaryDetail,
        page: () => const DiaryDetailPage()), //다이어리 상세
    GetPage(name: AppRoutes.noteAdd, page: () => const NoteAddPage()), //노트 추가
    GetPage(
        name: AppRoutes.noteDetail, page: () => const NoteDetailPage()), //노트 상세
  ];
}
