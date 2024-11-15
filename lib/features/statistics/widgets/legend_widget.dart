import 'package:flutter/material.dart';

import '../../../core/config/my_colors.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(color: Color(0xffF05656), label: 'Expense'),
        SizedBox(width: 62),
        _LegendItem(color: Color(0xff56F0A8), label: 'Income'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.color,
    required this.label,
  });

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 22,
          width: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 14),
        Text(
          label,
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
