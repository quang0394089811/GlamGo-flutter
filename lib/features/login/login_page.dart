import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_shop/features/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text('Login Page'),
      ),
    ));
  }
}
