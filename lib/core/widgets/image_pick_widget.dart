import 'dart:io';

import 'package:flutter/material.dart';

import '../config/my_colors.dart';
import 'my_button.dart';
import 'svg_wid.dart';

class ImagePickWidget extends StatelessWidget {
  const ImagePickWidget({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  final String imagePath;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 168,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          width: 4,
          color: MyColors.main,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            spreadRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MyButton(
        onPressed: onPressed,
        child: Center(
          child: imagePath.isEmpty
              ? const SvgWid(
                  'assets/s1.svg',
                  color: MyColors.main,
                  height: 96,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(84),
                  child: Image.file(
                    File(imagePath),
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
