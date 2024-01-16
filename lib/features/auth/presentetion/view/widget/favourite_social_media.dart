// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../data/model/social_media_model.dart';

class FavouriteSocialMedia extends StatefulWidget {
  String? socialMediaValue;
  FavouriteSocialMedia({
    Key? key,
    this.socialMediaValue,
  }) : super(key: key);

  @override
  State<FavouriteSocialMedia> createState() => _FavouriteSocialMediaState();
}

class _FavouriteSocialMediaState extends State<FavouriteSocialMedia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          favouriteList.length,
          (index) => customCheckBoxListTiel(
            icon: favouriteList[index].icon,
            text: favouriteList[index].text,
            value: widget.socialMediaValue == favouriteList[index].text,
            onChanged: (v) {
              setState(() {
                widget.socialMediaValue = v! ? favouriteList[index].text : null;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget customCheckBoxListTiel({
    required IconData icon,
    required String text,
    required bool value,
    required Function(bool?)? onChanged,
  }) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            checkColor: Colors.white,
            activeColor: Colors.green,
            overlayColor: const MaterialStatePropertyAll(Colors.red),
          ),
          Icon(
            icon,
            color: Colors.blue,
            size: 20,
          ),
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
    );
  }
}
