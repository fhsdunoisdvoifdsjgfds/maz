import 'package:flutter/material.dart';

import '../../../core/config/my_colors.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            color: MyColors.main,
            fontSize: 12,
            fontFamily: MyFonts.ns400,
          ),
        ),
      ],
    );
  }
}
