import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedialModel {
  final String text;
  final IconData icon;
  bool isFavourite;
  SocialMedialModel({
    required this.text,
    required this.icon,
    this.isFavourite = false,
  });
}

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
