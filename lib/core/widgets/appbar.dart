import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/my_colors.dart';
import '../config/utilities.dart';
import 'my_button.dart';
import 'svg_wid.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
    required this.title,
    this.white = false,
    this.back = true,
    this.onDelete,
  });

  final String title;
  final bool white;
  final bool back;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 24 + statusBar(context)),
      child: Row(
        children: [
          if (back) ...[
            const SizedBox(width: 16),
            MyButton(
              onPressed: () {
                context.pop();
              },
              child: SizedBox(
                height: 44,
                width: 44,
                child: Center(
                  child: SvgWid(
                    'assets/back.svg',
                    color: white ? Colors.white : null,
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: white ? Colors.white : MyColors.main,
                  fontSize: 36,
                  fontFamily: MyFonts.ns700,
                ),
              ),
            ),
          ),
          if (back) ...[
            if (onDelete != null) ...[
              MyButton(
                onPressed: onDelete,
                child: const SizedBox(
                  height: 44,
                  width: 44,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ] else
              const SizedBox(width: 60),
          ],
        ],
      ),
    );
  }
}
