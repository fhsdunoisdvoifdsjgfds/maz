import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/config/utilities.dart';
import 'legend_widget.dart';
import 'summary_row.dart';

class MonthPieChart extends StatelessWidget {
  const MonthPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    double incomes = 0;
    double expenses = 0;
    for (double i in getMonthAmounts(true)) {
      incomes += i;
    }
    for (double i in getMonthAmounts(false)) {
      expenses += i;
    }
    final total = incomes - expenses;

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: Row(
            children: [
              const SizedBox(width: 26),
              _PieChart(
                incomes: getMonthAmounts(true)[0],
                expenses: getMonthAmounts(false)[0],
              ),
              const Spacer(),
              _PieChart(
                incomes: getMonthAmounts(true)[1],
                expenses: getMonthAmounts(false)[1],
              ),
              const Spacer(),
              _PieChart(
                incomes: getMonthAmounts(true)[2],
                expenses: getMonthAmounts(false)[2],
              ),
              const Spacer(),
              _PieChart(
                incomes: getMonthAmounts(true)[3],
                expenses: getMonthAmounts(false)[3],
              ),
              const SizedBox(width: 26),
            ],
          ),
        ),
        Container(
          height: 2,
          color: MyColors.main,
          margin: const EdgeInsets.symmetric(horizontal: 26),
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            SizedBox(width: 26),
            _Title('Week 1'),
            Spacer(),
            _Title('Week 2'),
            Spacer(),
            _Title('Week 3'),
            Spacer(),
            _Title('Week 4'),
            SizedBox(width: 26),
          ],
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

class _PieChart extends StatelessWidget {
  const _PieChart({
    required this.incomes,
    required this.expenses,
  });

  final double incomes;
  final double expenses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: PieChart(
        PieChartData(
          sectionsSpace: 1,
          centerSpaceRadius: 19,
          startDegreeOffset: 90,
          sections: [
            PieChartSectionData(
              color: const Color(0xffF05656),
              value: expenses,
              radius: 8,
              showTitle: false,
            ),
            PieChartSectionData(
              color: const Color(0xff56F0A8),
              value: incomes,
              radius: 8,
              showTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: MyColors.main,
        fontSize: 12,
        fontFamily: MyFonts.ns400,
      ),
    );
  }
}
