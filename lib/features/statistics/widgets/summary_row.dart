import 'package:flutter/material.dart';

import '../../../core/config/my_colors.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Row(
        children: [
          SizedBox(
            width: 126,
            child: Text(
              label,
              style: const TextStyle(
                color: MyColors.main,
                fontSize: 18,
                fontFamily: MyFonts.ns400,
              ),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: MyColors.main,
              fontSize: 22,
              fontFamily: MyFonts.ns900,
            ),
          ),
        ],
      ),
    );
  }
}
