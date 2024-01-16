import 'package:flutter/material.dart';

import '../../../../../core/app_color/app_color.dart';
import '../screen/sign_up.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account ?",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.gray,
          ),
        ),
        const SizedBox(width: 5),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return const SignUpScreen();
              }),
              (route) => false,
            );
          },
          child: const Text(
            "Register",
            style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
