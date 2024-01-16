// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/shared_widget/custom_text_field.dart';

class FirstAndLastName extends StatelessWidget {
  const FirstAndLastName({
    Key? key,
    this.firstNameController,
    this.lastNameController,
    this.firstNameValue,
    this.lastNameValue,
  }) : super(key: key);

  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final String? firstNameValue;
  final String? lastNameValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('First Name'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: firstNameController,
                hintText: firstNameValue,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Last Name'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: lastNameController,
                hintText: lastNameValue,
                // hintText: 'Enter Your LastName',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
