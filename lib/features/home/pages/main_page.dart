import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/config/my_colors.dart';
import '../../../core/models/newss.dart';
import '../../../core/config/utilities.dart';
import '../../../core/widgets/my_button.dart';
import '../../news/widgets/news_card.dart';
import '../widgets/add_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8 + statusBar(context)),
        Row(
          children: [
            const SizedBox(width: 60),
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: MyColors.main,
                ),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: Image.file(
                    File(profile.image),
                    width: 34,
                    height: 34,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container();
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Balance',
              style: TextStyle(
                fontSize: 36,
                color: MyColors.main,
                fontFamily: MyFonts.ns700,
              ),
            ),
            const SizedBox(width: 34),
            const Spacer(),
            const SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 116,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            color: MyColors.main,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 17,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Center(
                child: Text(
                  'Id: $userId',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: MyFonts.ns700,
                  ),
                ),
              ),
              const Spacer(),
              BlocBuilder<IncExpBloc, IncExpState>(
                builder: (context, state) {
                  return Text(
                    formatNumber(getTotalAmount()),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: MyFonts.ns900,
                    ),
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 60),
            AddButton(title: 'Income', asset: 'add1'),
            Spacer(),
            AddButton(title: 'Expense', asset: 'add2'),
            Spacer(),
            AddButton(title: 'History', asset: 'history'),
            SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            color: MyColors.main,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              children: [
                const SizedBox(height: 26),
                Row(
                  children: [
                    const SizedBox(width: 33),
                    const Text(
                      'News',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: MyFonts.ns700,
                      ),
                    ),
                    const Spacer(),
                    MyButton(
                      onPressed: () {
                        context.push('/home/news');
                      },
                      minSize: 20,
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: MyFonts.ns700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 33),
                  ],
                ),
                const SizedBox(height: 20),
                NewsCard(newss: newssList[0]),
                NewsCard(newss: newssList[1]),
                NewsCard(newss: newssList[2]),
                const SizedBox(height: 72),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
