import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/my_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.length = 20,
    this.number = false,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final int length;
  final bool number;
  final void Function() onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextInputType? _keyboard() {
    if (widget.number) return TextInputType.number;
    return null;
  }

  List<TextInputFormatter>? _formatters() {
    final digit = FilteringTextInputFormatter.digitsOnly;
    final length = LengthLimitingTextInputFormatter(widget.length);
    if (widget.number) return [length, digit];
    return [length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(
          width: 1,
          color: MyColors.main,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: _keyboard(),
        inputFormatters: _formatters(),
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: MyColors.main,
          fontSize: 14,
          fontFamily: MyFonts.ns400,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
          hintText: widget.hintText,
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
        onChanged: (value) {
          widget.onChanged();
        },
      ),
    );
  }
}
