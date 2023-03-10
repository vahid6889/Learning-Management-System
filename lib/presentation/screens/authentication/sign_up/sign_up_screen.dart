import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/route_manager.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ScrollController? scrollController;
  bool lastStatus = true;

  bool get isShrink {
    return scrollController != null &&
        scrollController!.hasClients &&
        scrollController!.offset > (AppSize.s260);
  }

  void scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController?.removeListener(scrollListener);
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:
              isShrink ? ColorManager.lightBlack1 : ColorManager.black),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(AppStringSignUp.signUpPageTitle),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStringSignUp.headerText,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle1,
                            children: [
                              const TextSpan(
                                text:
                                    'By using our services you are agreeting to our ',
                              ),
                              TextSpan(
                                text: 'Terms',
                                style: TextStyle(
                                  color: ColorManager.lightBlue1,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Statement',
                                style: TextStyle(
                                  color: ColorManager.lightBlue1,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 370,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p24),
                    child: Positioned(
                      top: AppSize.s45,
                      left: AppSize.s0,
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width -
                            AppPadding.p24),
                        height: AppSize.s175,
                        child: Column(
                          children: [
                            SizedBox(
                                width: (MediaQuery.of(context).size.width -
                                    AppPadding.p24),
                                child: Column(
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(50),
                                        foregroundColor:
                                            ColorManager.darkWhite1,
                                        side: BorderSide(
                                          color: ColorManager.grey,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.signUpUserName);
                                      },
                                      child: Text(
                                        AppStringSignUp
                                            .signUpWithUsernameButtonText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(50),
                                        foregroundColor:
                                            ColorManager.darkWhite1,
                                        side: BorderSide(
                                          color: ColorManager.grey,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        AppStringSignUp
                                            .signUpWithGoogleButtonText,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                  ],
                                )),
                            AnimatedOpacity(
                              duration: const Duration(
                                  milliseconds: DurationConstant.d2000),
                              opacity: isShrink ? AppSize.s1 : AppSize.s0,
                              child: const SizedBox(
                                height: AppSize.s8,
                              ),
                            ),
                            AnimatedOpacity(
                              duration: const Duration(
                                  milliseconds: DurationConstant.d2000),
                              opacity: isShrink ? AppSize.s1 : AppSize.s0,
                              child: SizedBox(
                                height: AppSize.s4,
                                child: Divider(
                                  thickness: AppSize.s1,
                                  color: ColorManager.darkWhite1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 170,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(text: 'New here?   '),
                              TextSpan(
                                text: AppStringSignUp.createAccountButtonText,
                                style: TextStyle(
                                  color: ColorManager.lightBlue1,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, Routes.signIn);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
