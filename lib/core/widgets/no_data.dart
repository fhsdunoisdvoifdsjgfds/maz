import 'package:flutter/material.dart';

import '../config/my_colors.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No data...',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontFamily: MyFonts.ns700),
      ),
    );
  }
}
