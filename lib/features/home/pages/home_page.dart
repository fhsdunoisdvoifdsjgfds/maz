import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/navbar/navbar_bloc.dart';
import '../../statistics/pages/statistics_page.dart';
import '../../lessons/pages/lessons_page.dart';
import '../../settings/pages/settings_page.dart';
import '../widgets/nav_bar.dart';
import 'main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavbarBloc, NavbarState>(
            builder: (context, state) {
              if (state is NavbarStatistic) return const StatisticsPage();

              if (state is NavbarLessons) return const LessonsPage();

              if (state is NavbarSettings) return const SettingsPage();

              return const MainPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
