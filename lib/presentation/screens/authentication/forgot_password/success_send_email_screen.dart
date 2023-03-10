import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';

class SuccessSendEmail extends StatelessWidget {
  const SuccessSendEmail({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorManager.black),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                    AppStringSendSuccesEmailForgotPasswordScreen.headerText),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Container(
                      child: Column(
                        children: [
                          IconTheme(
                            data: IconThemeData(
                              color: ColorManager.darkWhite5,
                              size: AppSize.s40,
                            ),
                            child: const Icon(Icons.check),
                          ),
                          Text(
                            AppStringSendSuccesEmailForgotPasswordScreen
                                .titlePageText,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            AppStringSendSuccesEmailForgotPasswordScreen
                                .descriptionText,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Didn't get it?",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 150,
                                      child: TextButton(
                                        onPressed: () {
                                          // Navigator.pushNamed(context,
                                          //     Routes.signInPasswordScreen);
                                        },
                                        child: const Text(
                                          AppStringSendSuccesEmailForgotPasswordScreen
                                              .linkDontGetItText,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
