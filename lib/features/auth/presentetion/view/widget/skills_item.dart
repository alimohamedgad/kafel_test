import 'package:flutter/material.dart';

class SkillsItem extends StatelessWidget {
  const SkillsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.withOpacity(0.1),
      ),
      child: const Text('Video Production'),
    );
  }
}
