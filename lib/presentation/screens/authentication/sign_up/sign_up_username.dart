import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:learning_management_system/presentation/resources/color_manager.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_management_system/presentation/widgets/widgets.dart';

class SignUpUserNameScreen extends StatefulWidget {
  const SignUpUserNameScreen({Key? key}) : super(key: key);

  @override
  State<SignUpUserNameScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpUserNameScreen> {
  TextEditingController dateInput = TextEditingController();
  int _activeStepIndex = 0;

  @override
  void initState() {
    super.initState();
    dateInput.text = "";
  }

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.indexed : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title:
              const Text(AppStringSignUpUsernameAccountStepper.stepTitleText),
          content: Center(
            child: Container(
              child: Column(
                children: [
                  Text(
                    AppStringSignUpUsernameAccountStepper.stepContentText,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  registerTextFormField(
                    labelText: AppStringSignUpUsernameAccountStepper
                        .hintUsernameFieldText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  registerTextFormField(
                    labelText: AppStringSignUpUsernameAccountStepper
                        .hintPasswordFieldText,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.indexed : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title:
              const Text(AppStringSignUpUsernameProfileStepper.stepTitleText),
          content: Center(
            child: Container(
              child: Column(
                children: [
                  Text(
                    AppStringSignUpUsernameProfileStepper.stepContentText,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  registerTextFormField(
                    labelText: AppStringSignUpUsernameProfileStepper
                        .hintEmailFieldText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  registerTextFormField(
                    labelText: AppStringSignUpUsernameProfileStepper
                        .hintPhoneNumberFieldText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  registerTextFormField(
                    labelText: AppStringSignUpUsernameProfileStepper
                        .hintNationCodeFieldText,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  registerTextFormField(
                    labelText: AppStringSignUpUsernameProfileStepper
                        .hintDateBirthFieldText,
                    controller: dateInput,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        initialEntryMode: DatePickerEntryMode.input,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary:
                                    ColorManager.lightBlack1, // <-- SEE HERE
                                onPrimary:
                                    ColorManager.lightPurple, // <-- SEE HERE
                                onSurface: Colors.blueAccent, // <-- SEE HERE
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      ColorManager.black, // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 2 ? StepState.indexed : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title:
              const Text(AppStringSignUpUsernameConfirmStepper.stepTitleText),
          content: Column(
            children: [
              Center(
                child: Text(
                  AppStringSignUpUsernameConfirmStepper.stepContentText,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${AppStringSignUpUsernameConfirmStepper.hintUsernameFieldText}: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppStringSignUpUsernameConfirmStepper.hintEmailFieldText}: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppStringSignUpUsernameConfirmStepper.hintPhoneNumberFieldText}: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Password: ********',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppStringSignUpUsernameConfirmStepper.hintNationCodeFieldText}: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppStringSignUpUsernameConfirmStepper.hintDateBirthFieldText}: ',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ];

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
                title: Text(AppStringSignUpUsernameAccountStepper.headerText),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Theme(
                    data: ThemeData(
                      canvasColor: ColorManager.darkGrey,
                      hintColor: ColorManager.grey,
                      dialogBackgroundColor: ColorManager.lightPurple,
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: ColorManager.lightPurple,
                          ),
                    ),
                    child: Stepper(
                      controlsBuilder: (context, _) {
                        return Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (_activeStepIndex <
                                    (stepList().length - 1)) {
                                  _activeStepIndex += 1;
                                }
                                setState(() {});
                              },
                              child: const Text('Continue'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_activeStepIndex == 0) {
                                  return;
                                }
                                _activeStepIndex -= 1;
                                setState(() {});
                              },
                              child: const Text('Back'),
                            ),
                          ],
                        );
                      },
                      elevation: 03,
                      type: StepperType.horizontal,
                      currentStep: _activeStepIndex,
                      steps: stepList(),
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
