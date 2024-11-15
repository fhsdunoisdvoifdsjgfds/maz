import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/config/my_colors.dart';
import '../../../core/config/utilities.dart';
import 'legend_widget.dart';
import 'summary_row.dart';

class WeekPieChart extends StatelessWidget {
  const WeekPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    double incomes = 0;
    double expenses = 0;
    for (double i in getWeekAmounts(true)) {
      incomes += i;
    }
    for (double i in getWeekAmounts(false)) {
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
                incomes: getWeekAmounts(true)[0],
                expenses: getWeekAmounts(false)[0],
              ),
              const Spacer(),
              _PieChart(
                incomes: getWeekAmounts(true)[1],
                expenses: getWeekAmounts(false)[1],
              ),
              const Spacer(),
              _PieChart(
                incomes: getWeekAmounts(true)[2],
                expenses: getWeekAmounts(false)[2],
              ),
              const Spacer(),
              _PieChart(
                incomes: getWeekAmounts(true)[3],
                expenses: getWeekAmounts(false)[3],
              ),
              const Spacer(),
              _PieChart(
                incomes: getWeekAmounts(true)[4],
                expenses: getWeekAmounts(false)[4],
              ),
              const Spacer(),
              _PieChart(
                incomes: getWeekAmounts(true)[5],
                expenses: getWeekAmounts(false)[5],
              ),
              const Spacer(),
              _PieChart(
                incomes: getWeekAmounts(true)[6],
                expenses: getWeekAmounts(false)[6],
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
            _Title('Mon'),
            Spacer(),
            _Title('Tue'),
            Spacer(),
            _Title('Wed'),
            Spacer(),
            _Title('Thr'),
            Spacer(),
            _Title('Fri'),
            Spacer(),
            _Title('Sat'),
            Spacer(),
            _Title('Sun'),
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
      width: 28,
      height: 28,
      child: PieChart(
        PieChartData(
          sectionsSpace: 1,
          centerSpaceRadius: 10,
          startDegreeOffset: 90,
          sections: [
            PieChartSectionData(
              color: const Color(0xffF05656),
              value: expenses,
              radius: 4,
              showTitle: false,
            ),
            PieChartSectionData(
              color: const Color(0xff56F0A8),
              value: incomes,
              radius: 4,
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
