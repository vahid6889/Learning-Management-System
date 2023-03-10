import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/app/provider/authentication/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/route_manager.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:learning_management_system/presentation/widgets/widgets.dart';

class SignInUserNameScreen extends StatelessWidget {
  const SignInUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorManager.black),
    );
    final _auth = Provider.of<AuthenticationProvider>(context);
    final formKey = GlobalKey<FormState>();
    String? email, password;
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
                title: Text(AppStringSignInUsernameScreen.headerText),
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
                            AppStringSignInUsernameScreen.titlePageText,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            AppStringSignInUsernameScreen.descriptionText,
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
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        registerTextFormField(
                                          onSaved: (emailInput) {
                                            email = emailInput;
                                          },
                                          labelText:
                                              AppStringSignInUsernameScreen
                                                  .hintUsernameFieldText,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        registerTextFormField(
                                          onSaved: (passwordInput) {
                                            password = passwordInput;
                                          },
                                          labelText:
                                              AppStringSignInUsernameScreen
                                                  .hintPasswordFieldText,
                                          obscureText: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            Routes.forgotPasswordScreen);
                                      },
                                      child: const Text(
                                          AppStringSignInUsernameScreen
                                              .linkForgotPasswordText),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 120,
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
                                          // Navigator.pushNamed(context,
                                          //     Routes.signInPasswordScreen);
                                          formKey.currentState?.save();
                                          _auth.createUser(email, password);
                                        },
                                        child: Text(
                                          AppStringSignInUsernameScreen
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
