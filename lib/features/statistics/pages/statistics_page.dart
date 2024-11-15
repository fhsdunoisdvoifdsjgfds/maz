import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/tab_widget.dart';
import '../widgets/day_pie_chart.dart';
import '../widgets/month_pie_chart.dart';
import '../widgets/week_pie_chart.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Appbar(title: 'Statistic', back: false),
        const SizedBox(height: 30),
        BlocBuilder<IncExpBloc, IncExpState>(
          builder: (context, state) {
            return Expanded(
              child: TabWidget(
                titles: const ['Day', 'Week', 'Month'],
                pages: const [
                  DayPieChart(),
                  WeekPieChart(),
                  MonthPieChart(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
