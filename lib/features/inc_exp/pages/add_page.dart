import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/config/my_colors.dart';
import '../../../core/models/inc_exp.dart';
import '../../../core/config/utilities.dart';
import '../../../core/widgets/p_button.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/category_button.dart';
import '../widgets/title_text.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.isIncome});

  final bool isIncome;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final con1 = TextEditingController();
  final con2 = TextEditingController();
  final con3 = TextEditingController();

  void checkActive() {
    context.read<ButtonBloc>().add(
          CheckButtonActive(
            controllers: [con1.text, con2.text, con3.text],
          ),
        );
  }

  void onCategory(String value) {
    if (identical(value, con3.text)) return;
    con3.text = value;
    checkActive();
  }

  void onNext() {
    context.read<IncExpBloc>().add(
          AddIncExpEvent(
            model: IncExp(
                id: timestamp(),
                amount: int.tryParse(con1.text) ?? 0,
                title: con2.text,
                category: con3.text,
                isIncome: widget.isIncome),
          ),
        );
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    checkActive();
  }

  @override
  void dispose() {
    con1.dispose();
    con2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: MyColors.main,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(107),
              ),
            ),
          ),
          Column(
            children: [
              Appbar(
                title: widget.isIncome ? 'Add Income' : 'Add Expense',
                white: true,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 22,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(44),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(height: 50),
                        const TitleText('Amount'),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: con1,
                          hintText: widget.isIncome
                              ? 'Income amount'
                              : 'Expense amount',
                          number: true,
                          onChanged: checkActive,
                        ),
                        const SizedBox(height: 8),
                        const TitleText('Title'),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: con2,
                          hintText: 'Name title',
                          onChanged: checkActive,
                        ),
                        const SizedBox(height: 8),
                        const TitleText('Category'),
                        const SizedBox(height: 8),
                        BlocBuilder<ButtonBloc, ButtonState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                ...getCategories(widget.isIncome).map(
                                  (title) {
                                    return CategoryButton(
                                      title: title,
                                      current: con3.text,
                                      onPressed: onCategory,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 42),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              PButton(
                title: 'Next',
                onPressed: onNext,
              ),
              const SizedBox(height: 55),
            ],
          ),
        ],
      ),
    );
  }
}
