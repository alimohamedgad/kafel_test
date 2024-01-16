import 'package:flutter/material.dart';

class RememberMeForgetPassword extends StatelessWidget {
  const RememberMeForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (v) {},
          activeColor: Colors.green,
        ),
        const Text('Remember me'),
        const Spacer(),
        const Text('Forgot Password ?'),
      ],
    );
  }
}
