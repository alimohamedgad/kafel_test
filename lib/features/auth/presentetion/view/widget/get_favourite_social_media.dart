import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/model/social_media_model.dart';

class GetFavouriteSocialMedia extends StatefulWidget {
  String? isFavouriteSocialMediaData;
  GetFavouriteSocialMedia({
    Key? key,
    this.isFavouriteSocialMediaData,
  }) : super(key: key);

  @override
  State<GetFavouriteSocialMedia> createState() =>
      _GetFavouriteSocialMediaState();
}

class _GetFavouriteSocialMediaState extends State<GetFavouriteSocialMedia> {
  List<SocialMedialModel> favouriteList = [
    SocialMedialModel(
      text: 'facebook',
      icon: FontAwesomeIcons.facebook,
    ),
    SocialMedialModel(
      text: 'twitter',
      icon: FontAwesomeIcons.twitter,
    ),
    SocialMedialModel(
      text: 'linkdin',
      icon: FontAwesomeIcons.linkedin,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          favouriteList.length,
          (index) => customCheckBoxListTiel(
              icon: favouriteList[index].icon,
              text: favouriteList[index].text,
              value:
                  favouriteList[index].text == widget.isFavouriteSocialMediaData
                      ? true
                      : false,
              onChanged: (v) {}),
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
