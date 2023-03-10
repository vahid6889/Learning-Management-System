import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/screens/bottom_navigationBar/navigationBar_screen.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: const NavigationBarScreen(categoriesHomeScreen: true),
      ),
    );
  }
}
