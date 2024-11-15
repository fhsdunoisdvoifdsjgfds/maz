import 'package:flutter/material.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/config/utilities.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/svg_wid.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: () {
        onPressed(title);
      },
      minSize: 36,
      child: Container(
        height: 36,
        margin: const EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(
            width: 1,
            color: MyColors.main,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 46,
              child: Center(
                child: SvgWid(getCategoryAsset(title)),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: MyColors.main,
                fontSize: 14,
                fontFamily: MyFonts.ns400,
              ),
            ),
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: title == current ? MyColors.main : Colors.white,
                border: Border.all(
                  width: 1,
                  color: MyColors.main,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
