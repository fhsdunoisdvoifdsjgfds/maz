import 'package:flutter/material.dart';

import '../config/my_colors.dart';
import 'my_button.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
    required this.title,
    required this.onYes,
  });

  final String title;
  final void Function() onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: MyColors.main,
      child: SizedBox(
        height: 200,
        width: 320,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20, fontFamily: MyFonts.ns700, color: Colors.white),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 20),
                _Buttonn(
                  title: 'No',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                _Buttonn(
                  title: 'Yes',
                  onPressed: () {
                    Navigator.pop(context);
                    onYes();
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _Buttonn extends StatelessWidget {
  const _Buttonn({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: onPressed,
      padding: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: MyFonts.ns600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
