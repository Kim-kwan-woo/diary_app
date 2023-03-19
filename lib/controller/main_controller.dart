import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/controller/auth_controller.dart';
import 'package:diary_app/model/diary.dart';
import 'package:diary_app/service/db_service.dart';
import 'package:diary_app/service/storage_service.dart';
import 'package:diary_app/view/widget/custom_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController {
  var pageViewController = PageController(); //페이지뷰 컨트롤러
  RxList<bool> selections = [true, false].obs; //하단 토글 버튼 선택 옵션
  Rxn<String> downloadUrl = Rxn<String>(
      Get.find<AuthController>().user.value!.photoURL); //프로필 이미지 Url

  RxList<QueryDocumentSnapshot<Diary>> diaryList =
      RxList<QueryDocumentSnapshot<Diary>>(); //다이어리 리스트

  //유저 정보 가져오기
  Rxn<User> getUser() => Get.find<AuthController>().user;

  //페이지 이동
  jumpToPage(int page) => pageViewController.jumpToPage(page);

  /*다이어일 페이지*/
  //다이어리 추가
  createDiary() async {
    Diary diary = Diary(name: '새로운 다이어리', uid: getUser().value!.uid);
    await DBService().createDiary(diary);
    readDiary();
  }

  //다이어리 가져오기
  readDiary() async {
    diaryList.clear();
    diaryList(await DBService().readDiary(getUser().value!.uid));
  }

  //다이어리 이름 업데이트
  updateDiaryName(String id, String name) async {
    await DBService().updateDiary(id, name);
    readDiary();
  }

  //다이어리 삭제
  deleteDiary(String id) async {
    await DBService().deleteDiary(id);
    readDiary();
  }

  /*내 정보 페이지*/
  //로그아웃
  logout() => Get.find<AuthController>().logout();

  //프로필 사진 업로드
  uploadProfileImage(BottomSheetType option) async {
    var picker = ImagePicker();
    XFile? res;
    if (option == BottomSheetType.first) {
      res = await picker.pickImage(source: ImageSource.camera);
    } else {
      res = await picker.pickImage(source: ImageSource.gallery);
    }

    if (res != null) {
      //AuthController 가져오기
      var controller = Get.find<AuthController>();
      downloadUrl(await StorageService()
          .uploadProfileImage(controller.user.value!, File(res.path)));

      controller.uploadProfileImage(downloadUrl.value!);
    }
  }

  @override
  void onInit() {
    super.onInit();
    readDiary();
  }
}
