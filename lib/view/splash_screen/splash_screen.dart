import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    Future.delayed(const Duration(seconds: 2), () async {
      await authController.checkLoginStatus();
    });

    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Text(
                  "byte",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Text(
                  "Logik",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
