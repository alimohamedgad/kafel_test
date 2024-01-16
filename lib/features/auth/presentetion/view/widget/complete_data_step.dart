// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kafel_project/core/app_image/app_image.dart';
import 'package:kafel_project/core/shared_widget/custom_text_field.dart';
import 'package:kafel_project/features/auth/presentetion/cubit/auth_cubit.dart';

import 'favourite_social_media.dart';
import 'skills_item.dart';

// ignore: must_be_immutable
class CompleteData extends StatefulWidget {
  int gender;
  final TextEditingController birthDayController;
  final String socialMediaValue;
  CompleteData({
    Key? key,
    required this.gender,
    required this.birthDayController,
    required this.socialMediaValue,
  }) : super(key: key);

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.green.withOpacity(0.1),
                child: Image.asset(AppImage.clipped),
              ),
              const Positioned(
                bottom: -2,
                right: -3,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Text('About'),
        const SizedBox(height: 10),
        const CustomTextField(
          maxLines: 4,
        ),
        const SizedBox(height: 10),
        const Text('Salary'),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  increamentOrDecremantButton(
                    Icons.remove,
                    onTap: () {
                      authCubit.decrement();
                    },
                  ),
                  Text('SAR ${authCubit.salary}'),
                  increamentOrDecremantButton(Icons.add, onTap: () {
                    authCubit.increment();
                  }),
                ],
              ),
            );
          },
        ),
        const Text('Birth Date'),
        const SizedBox(height: 10),
        CustomTextField(
          readOnly: true,
          controller: widget.birthDayController,
          suffixIcon: Icons.date_range_rounded,
          onTap: () async {
            final birthDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (birthDate != null) {
              setState(() {
                widget.birthDayController.text =
                    ("${birthDate.day}/${birthDate.month}/${birthDate.year}");
              });
            }
          },
        ),
        const SizedBox(height: 10),
        const Text('Gender'),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: widget.gender,
                  onChanged: (v) {
                    setState(() {
                      widget.gender = v!;
                    });
                  },
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: widget.gender,
                  onChanged: (v) {
                    setState(() {
                      widget.gender = v!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
          ],
        ),
        const Text('Skills'),
        Row(
          children: List.generate(
            2,
            (index) => const SkillsItem(),
          ),
        ),
        const Text('Favourite Social Media'),
        const SizedBox(height: 10),
        FavouriteSocialMedia(socialMediaValue: widget.socialMediaValue),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget increamentOrDecremantButton(IconData icon, {Function()? onTap}) {
    return Container(
      height: 24,
      width: 24,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xffBAB5B5),
            spreadRadius: 0,
            offset: Offset(0, 2),
            blurRadius: 3,
          )
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.green,
          size: 20,
        ),
      ),
    );
  }
}
