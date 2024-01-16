// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kafel_project/features/auth/data/model/user_model.dart';
import 'package:kafel_project/features/auth/presentetion/cubit/auth_cubit.dart';

import '../../../../core/app_image/app_image.dart';
import '../../../../core/shared_widget/custom_text_field.dart';
import '../../../auth/presentetion/view/widget/favourite_social_media.dart';
import '../../../auth/presentetion/view/widget/first_and_last_name.dart';
import '../../../auth/presentetion/view/widget/get_favourite_social_media.dart';
import '../../../auth/presentetion/view/widget/skills_item.dart';

class WhoIamScreen extends StatefulWidget {
  const WhoIamScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WhoIamScreen> createState() => _WhoIamScreenState();
}

class _WhoIamScreenState extends State<WhoIamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Who Am I'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final authCubit = context.read<AuthCubit>();
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
                            child: Image.network(
                              authCubit.loginModel!.data.avatar,
                            ),
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
                    const SizedBox(height: 10),
                    FirstAndLastName(
                      firstNameValue: authCubit.loginModel!.data.firstName,
                      lastNameValue: authCubit.loginModel!.data.lastName,
                    ),
                    const SizedBox(height: 10),
                    const Text('Email Address'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: authCubit.loginModel!.data.email,
                    ),
                    const SizedBox(height: 10),
                    const Text('Password'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      // controller: widget.passwordController,
                      hintText: authCubit.loginModel!.data.password,
                    ),
                    const SizedBox(height: 10),
                    const Text('User Typ'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: authCubit.loginModel!.data.type.code,
                              onChanged: (v) {},
                            ),
                            const Text('Seller'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: authCubit.loginModel!.data.type.code,
                              onChanged: (v) {},
                            ),
                            const Text('Buyer'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: authCubit.loginModel!.data.type.code,
                              onChanged: (v) {},
                            ),
                            const Text('Both'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Salary'),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'SAR ${authCubit.loginModel!.data.salary}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('About'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      maxLines: 4,
                      hintText: authCubit.loginModel!.data.about,
                    ),
                    const Text('Birth Date'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      readOnly: true,
                      suffixIcon: Icons.date_range_rounded,
                      hintText: authCubit.loginModel!.data.birthDate,
                    ),
                    const SizedBox(height: 10),
                    const Text('Gender'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: authCubit.loginModel!.data.gender,
                              onChanged: (v) {},
                            ),
                            const Text('Male'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: authCubit.loginModel!.data.gender,
                              onChanged: (v) {},
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
                    GetFavouriteSocialMedia(
                        isFavouriteSocialMediaData:
                            authCubit.loginModel!.data.favoriteSocialMedia[0]),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
