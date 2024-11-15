import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/config/utilities.dart';
import 'legend_widget.dart';
import 'summary_row.dart';

class DayPieChart extends StatelessWidget {
  const DayPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final incomes = getTodayAmount(true);
    final expenses = getTodayAmount(false);
    final total = incomes - expenses;

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: SizedBox(
            width: 164,
            height: 164,
            child: PieChart(
              PieChartData(
                sectionsSpace: 1,
                centerSpaceRadius: 60,
                startDegreeOffset: 90,
                sections: [
                  PieChartSectionData(
                    color: const Color(0xffF05656),
                    value: expenses,
                    radius: 22,
                    showTitle: false,
                  ),
                  PieChartSectionData(
                    color: const Color(0xff56F0A8),
                    value: incomes,
                    radius: 22,
                    showTitle: false,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 2,
          color: MyColors.main,
          margin: const EdgeInsets.symmetric(horizontal: 26),
        ),
        const SizedBox(height: 8),
        Text(
          getCurrentWeekday(),
          style: const TextStyle(
            color: MyColors.main,
            fontSize: 12,
            fontFamily: MyFonts.ns400,
          ),
        ),
        const SizedBox(height: 16),
        const LegendWidget(),
        const Spacer(),
        SummaryRow(
          label: 'Total expense:',
          value: '\$ ${expenses.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 42),
        SummaryRow(
          label: 'Total income:',
          value: '\$ ${incomes.toStringAsFixed(2)}',
        ),
        const SizedBox(height: 42),
        SummaryRow(
          label: 'All:',
          value: '\$ ${total.toStringAsFixed(2)}',
        ),
        const Spacer(),
        const SizedBox(height: 72),
      ],
    );
  }
}
