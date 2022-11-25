import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtftest/main.dart';
import 'package:wtftest/presentation/home/home_screen.dart';
import 'package:wtftest/presentation/onboarding/onboarding.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashFetch();
    return Scaffold(
      body: Container(
        decoration: backgrounColor(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.h,
                    ),
                    kheight,
                    SizedBox(
                      child: Image.asset('asset/image/image1.webp'),
                    ),
                    kheight20,
                  ],
                ),
              ),
              LoadingAnimationWidget.staggeredDotsWave(
                color: kwhite,
                size: 70.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> splashFetch() async {
    if (await _requestPermission(Permission.location)) {
      loggedIn();
    } else {
      splashFetch();
    }
  }

  Future<bool> _requestPermission(Permission isPermission) async {
    const Permission store = Permission.locationAlways;
    const Permission access = Permission.locationWhenInUse;

    if (await isPermission.isGranted) {
      await access.isGranted && await store.isGranted;
      return true;
    } else {
      final PermissionStatus result = await store.request();
      final PermissionStatus oneresult = await access.request();

      if (result == PermissionStatus.limited &&
          oneresult == PermissionStatus.limited) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> loggedIn() async {
    final SharedPreferences sharedpreferen =
        await SharedPreferences.getInstance();
    final bool? logedin = sharedpreferen.getBool(savestate);
    if (logedin == null || logedin == false) {
      login();
    } else {
      Get.off(() => const HomeScreen());
    }
  }

  void login() {
    Timer(
      const Duration(seconds: 5),
      () => Get.offAll(
        () => const OnBoardingScreen(),
      ),
    );
  }
}

BoxDecoration backgrounColor() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color(0xFF955cd1),
        Color(0xFF3fa2fa),
      ],
      stops: <double>[
        0.2,
        0.85,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );
}
