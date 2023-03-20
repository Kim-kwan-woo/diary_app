import 'package:diary_app/view/page/diary_detail_page.dart';
import 'package:diary_app/view/page/login_page.dart';
import 'package:diary_app/view/page/main_page.dart';
import 'package:diary_app/view/page/note_add_page.dart';
import 'package:diary_app/view/page/signup_page.dart';

class AppRoutes {
  static const String login = LoginPage.route; //로그인 페이지
  static const String signup = SignupPage.route; //회원가입 페이지
  static const String main = MainPage.route; //메인 페이지
  static const String diaryDetail = DiaryDetailPage.route; //다이어리 상세 페이지
  static const String noteAdd = NoteAddPage.route; //노트 추가 페이지
}
