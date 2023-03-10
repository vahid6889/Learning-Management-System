import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/route_manager.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:learning_management_system/presentation/widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isSending = false;

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
                title: Text(AppStringForgotPasswordScreen.headerText),
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
                          Text(
                            AppStringForgotPasswordScreen.titlePageText,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            AppStringForgotPasswordScreen.descriptionText,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    canvasColor: ColorManager.darkGrey,
                                    hintColor: ColorManager.grey,
                                    dialogBackgroundColor:
                                        ColorManager.lightPurple,
                                    colorScheme:
                                        Theme.of(context).colorScheme.copyWith(
                                              primary: ColorManager.lightPurple,
                                            ),
                                  ),
                                  child: registerTextFormField(
                                    labelText: AppStringForgotPasswordScreen
                                        .hintEmailFieldText,
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorManager.darkWhite5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isSending = true;
                                          });
                                          Navigator.pushNamed(context,
                                              Routes.successSendEmailScreen);
                                        },
                                        child: _isSending
                                            ? SizedBox(
                                                width: 25,
                                                height: 25,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                    ColorManager.lightPurple,
                                                  ),
                                                  backgroundColor:
                                                      ColorManager.white,
                                                ),
                                              )
                                            : Text(
                                                AppStringForgotPasswordScreen
                                                    .submitButtonText,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button,
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
