// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../../core/shared_widget/custom_stepper.dart';
import '../widget/complete_data_step.dart';
import '../widget/step_register.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final emailController = TextEditingController();
  final aboutContrroler = TextEditingController();
  final birthDayController = TextEditingController();
  PageController pageController = PageController(initialPage: 0);

  int userTyp = 0;
  int gender = 0;
  int _currentIndex = 0;

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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                StepperComponent(
                  text: 'Register',
                  currentIndex: _currentIndex,
                  index: 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                    pageController.jumpToPage(0);
                  },
                ),
                StepperComponent(
                  text: 'CompleteData',
                  currentIndex: _currentIndex,
                  index: 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                    pageController.jumpToPage(1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (v) {
                setState(() {
                  _currentIndex = v;
                });
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return _currentIndex == 0
                    ? StepRegister(
                        pageController: pageController,
                        confirmPassword: confirmPassword,
                        emailController: emailController,
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        passwordController: passwordController,
                        userTyp: userTyp,
                      )
                    : CompleteData(
                        userTyp: userTyp,
                        birthDayController: birthDayController,
                        socialMediaValue: socialMediaValue,
                        gender: gender,
                        emailController: emailController,
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        passwordController: passwordController,
                        aboutContrroler: aboutContrroler,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
