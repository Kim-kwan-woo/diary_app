import 'package:diary_app/controller/auth_controller.dart';
import 'package:diary_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<AuthController> {
  const MainPage({super.key});
  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      body: Column(
        children: [
          Text('hi'),
          TextButton(
            onPressed: controller.logout,
            child: Text('로그아웃'),
          )
        ],
      ),
    );
  }
}
