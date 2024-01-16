import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafel_project/core/app_image/app_image.dart';
import 'package:kafel_project/features/auth/presentetion/cubit/auth_cubit.dart';
import 'package:kafel_project/features/bottom_nav_bar.dart';
import 'package:kafel_project/features/services/presentetion/view/screens/services_screen.dart';

import '../../../../../core/shared_widget/custom_text_field.dart';
import '../widget/dont_have_an_account.dart';
import '../widget/remember_me_forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: "aligad@gmail.com");
  final passwordController = TextEditingController(text: "123123123");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Login',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppImage.login,
                  height: 225,
                  width: 225,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Email Address'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: emailController,
                hintText: 'Enter Your email',
              ),
              const SizedBox(height: 10),
              const Text('Password'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter Your Password',
              ),
              const RememberMeForgetPassword(),
              const SizedBox(height: 26),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const NavBarScreen();
                        },
                      ),
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  final authCubit = context.read<AuthCubit>();
                  return state is LoginLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            await authCubit.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                },
              ),
              const SizedBox(height: 18),
              const DontHaveAnAccount()
            ],
          ),
        )),
      ),
    );
  }
}
