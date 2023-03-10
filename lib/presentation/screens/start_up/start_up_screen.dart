import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:learning_management_system/presentation/controllers/category_controller.dart';
import 'package:learning_management_system/presentation/screens/bottom_navigationBar/navigationBar_screen.dart';
import 'package:rive/rive.dart';
import 'dart:async';
import 'package:learning_management_system/presentation/services/authentication/sign_up_service.dart';

class StartUP extends StatefulWidget {
  const StartUP({super.key});

  @override
  State<StartUP> createState() => _StartUPState();
}

class _StartUPState extends State<StartUP> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationBarScreen(),
        ),
      ),
    );
    // SignUpService.newUser('test user name', 'password123');
    CategoryController.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: ColorManager.black,
        systemNavigationBarDividerColor: ColorManager.black,
      ),
    );
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/image/start_up_page/spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset('assets/rive_assets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
              child: const Opacity(opacity: 1),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              child: Column(
                children: [
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          AppStringStartUpPage.headerText,
                          style: TextStyle(
                            color: ColorManager.darkWhite1,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          AppStringStartUpPage.introductionText,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinearProgressIndicator(
                          backgroundColor: ColorManager.lightBlack1,
                          valueColor:
                              AlwaysStoppedAnimation(ColorManager.darkWhite1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
