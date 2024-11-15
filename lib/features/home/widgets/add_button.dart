import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/svg_wid.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onPressed: () {
            if (title == 'Income') context.push('/home/add', extra: true);
            if (title == 'Expense') context.push('/home/add', extra: false);
            if (title == 'History') context.push('/home/history');
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: MyColors.main,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: SvgWid('assets/$asset.svg'),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
            color: MyColors.main,
            fontSize: 16,
            fontFamily: MyFonts.ns600,
          ),
        ),
      ],
    );
  }
}
