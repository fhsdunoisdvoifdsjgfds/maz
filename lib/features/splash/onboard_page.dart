import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/utilities.dart';
import '../../core/config/my_colors.dart';
import '../../core/widgets/p_button.dart';
import '../../core/widgets/svg_wid.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: statusBar(context)),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Manage your finances. We are sure you will find it useful!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColors.main,
                fontSize: 32,
                fontFamily: MyFonts.ns700,
              ),
            ),
          ),
          const Spacer(),
          const SvgWid('assets/onboard1.svg'),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Text(
              'Use all the features, start monitoring your finances, share your stats with friends',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.8,
                color: MyColors.main,
                fontSize: 18,
                fontFamily: MyFonts.ns300,
              ),
            ),
          ),
          const SizedBox(height: 30),
          PButton(
            title: 'Continue',
            onPressed: () {
              context.push('/onboard/profile');
            },
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
