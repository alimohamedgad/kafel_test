// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafel_project/features/auth/data/model/data_user_model.dart';
import 'package:kafel_project/features/auth/data/model/tags_user_model.dart';
import 'package:kafel_project/features/auth/data/model/typ_user_model.dart';
import 'package:kafel_project/features/auth/data/model/user_model.dart';
import 'package:kafel_project/features/auth/presentetion/cubit/auth_cubit.dart';

import '../../../../../core/app_color/app_color.dart';
import '../widget/complete_data_step.dart';
import '../widget/step_register.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController(text: 'ali');
  final lastNameController = TextEditingController(text: 'gaad');
  final passwordController = TextEditingController(text: '123123123');
  final confirmPassword = TextEditingController(text: '123123123');
  final emailController = TextEditingController(text: 'luka@gmail.com');
  final aboutContrroler = TextEditingController(text: 'helloooooo');
  final birthDayController = TextEditingController();

  int userTyp = 0;
  int gender = 0;

  int currestStep = 0;
  String socialMediaValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Register',
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
                Text(
                  'Complete Data',
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                canvasColor: Colors.transparent,
                primaryColor: Colors.green,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: Colors.green,
                      background: Colors.red,
                      secondary: Colors.green,
                    ),
              ),
              child: Stepper(
                margin: EdgeInsets.zero,
                type: StepperType.horizontal,
                elevation: 0.0,
                currentStep: currestStep,
                controlsBuilder: (context, details) {
                  return currestStep == 0
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              if (currestStep < (steps().length - 1)) {
                                currestStep += 1;
                              }
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.mainColor,
                              minimumSize: const Size(150, 40),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            final authCubit = context.read<AuthCubit>();
                            return ElevatedButton(
                              onPressed: () async {
                                await authCubit.signUp(
                                  DataUserModel(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    password: passwordController.text,
                                    about: aboutContrroler.text,
                                    tags: [
                                      {
                                        "id": 1,
                                        "name": "إدارة البريد الإلكتروني"
                                      }
                                    ],
                                    favoriteSocialMedia: [
                                      socialMediaValue,
                                    ],
                                    salary: authCubit.salary,
                                    email: emailController.text,
                                    birthDate: birthDayController.text,
                                    gender: gender,
                                    type: {
                                      "code": 1,
                                      "name": "buyer",
                                      "nice_name": "مشتري"
                                    },
                                    avatar:
                                        'https://kafiil.s3.eu-central-1.amazonaws.com/media/avatar/0beb8a0e461bca0dd8ef23b0eed3f777/VTWjmwqoGtXKH7xA26bEvOHtK2lMbMT5.png',
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.mainColor,
                                minimumSize: const Size(150, 40),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        );
                },
                steps: steps(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> steps() {
    return [
      Step(
        isActive: currestStep >= 0,
        title: const Text(''),
        content: StepRegister(
          confirmPassword: confirmPassword,
          emailController: emailController,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          passwordController: passwordController,
          userTyp: userTyp,
        ),
      ),
      Step(
        isActive: currestStep >= 1,
        title: const Text(''),
        content: CompleteData(
          birthDayController: birthDayController,
          socialMediaValue: socialMediaValue,
          gender: gender,
        ),
      ),
    ];
  }
}
