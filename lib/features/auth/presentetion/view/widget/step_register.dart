// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_field.dart';
import 'first_and_last_name.dart';

// ignore: must_be_immutable
class StepRegister extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPassword;
  int userTyp;
  StepRegister({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPassword,
    required this.userTyp,
  }) : super(key: key);

  @override
  State<StepRegister> createState() => _StepRegisterState();
}

class _StepRegisterState extends State<StepRegister> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FirstAndLastName(
          firstNameController: widget.firstNameController,
          lastNameController: widget.lastNameController,
        ),
        const SizedBox(height: 10),
        const Text('Email Address'),
        const SizedBox(height: 10),
        CustomTextField(
          controller: widget.emailController,
          hintText: 'Enter Your email',
        ),
        const SizedBox(height: 10),
        const Text('Password'),
        const SizedBox(height: 10),
        CustomTextField(
          controller: widget.passwordController,
          hintText: 'Enter Your Password',
        ),
        const SizedBox(height: 10),
        const Text('Confirm Password'),
        const SizedBox(height: 10),
        CustomTextField(
          controller: widget.confirmPassword,
          hintText: 'Confirm Password',
        ),
        const SizedBox(height: 20),
        const Text('User Typ'),
        const SizedBox(height: 10),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: widget.userTyp,
                  onChanged: (v) {
                    setState(() {
                      widget.userTyp = v!;
                    });
                  },
                ),
                const Text('Seller'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: widget.userTyp,
                  onChanged: (v) {
                    setState(() {
                      widget.userTyp = v!;
                    });
                  },
                ),
                const Text('Buyer'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: widget.userTyp,
                  onChanged: (v) {
                    setState(() {
                      widget.userTyp = v!;
                    });
                  },
                ),
                const Text('Both'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
