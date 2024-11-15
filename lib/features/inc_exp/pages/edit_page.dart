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
import '../../../core/widgets/delete_dialog.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/category_button.dart';
import '../widgets/title_text.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.model});

  final IncExp model;

  @override
  State<EditPage> createState() => _AddPageState();
}

class _AddPageState extends State<EditPage> {
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
          EditIncExpEvent(
            model: IncExp(
                id: widget.model.id,
                amount: int.tryParse(con1.text) ?? 0,
                title: con2.text,
                category: con3.text,
                isIncome: widget.model.isIncome),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: widget.model.isIncome ? 'Delete Income?' : 'Delete Expense?',
          onYes: () {
            context.read<IncExpBloc>().add(
                  DeleteIncExpEvent(model: widget.model),
                );
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    con1.text = widget.model.amount.toString();
    con2.text = widget.model.title;
    con3.text = widget.model.category;
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
                title: widget.model.isIncome ? 'Edit Income' : 'Edit Expense',
                white: true,
                onDelete: onDelete,
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
                          hintText: widget.model.isIncome
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
                                ...getCategories(widget.model.isIncome).map(
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
