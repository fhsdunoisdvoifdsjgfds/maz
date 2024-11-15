import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/no_data.dart';
import '../../../core/widgets/tab_widget.dart';
import '../widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Appbar(title: 'History'),
          const SizedBox(height: 30),
          BlocBuilder<IncExpBloc, IncExpState>(
            builder: (context, state) {
              if (state is IncExpLoadedState) {
                return Expanded(
                  child: TabWidget(
                    initialIndex: 1,
                    titles: const ['Income', 'All', 'Expense'],
                    pages: [
                      _buildHistoryList(state, isIncome: true),
                      _buildHistoryList(state),
                      _buildHistoryList(state, isIncome: false),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(IncExpLoadedState state, {bool? isIncome}) {
    final filteredModels = isIncome == null
        ? state.models
        : state.models.where((model) => model.isIncome == isIncome).toList();

    return filteredModels.isEmpty
        ? const NoData()
        : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            itemCount: filteredModels.length,
            itemBuilder: (context, index) => Column(
              children: [
                if (index == 0) const SizedBox(height: 15),
                HistoryCard(model: filteredModels[index]),
              ],
            ),
          );
  }
}
