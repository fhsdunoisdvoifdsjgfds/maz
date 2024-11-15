import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/my_colors.dart';

class ProfileField extends StatelessWidget {
  const ProfileField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 36,
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          border: Border.all(
            width: 1,
            color: MyColors.main,
          ),
        ),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          inputFormatters: [LengthLimitingTextInputFormatter(20)],
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(
            color: MyColors.main,
            fontSize: 14,
            fontFamily: MyFonts.ns400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 24,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffD3D3D3),
              fontSize: 14,
              fontFamily: MyFonts.ns400,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
