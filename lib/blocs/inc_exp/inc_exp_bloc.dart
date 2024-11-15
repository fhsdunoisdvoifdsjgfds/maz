import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/inc_exp.dart';
import '../../core/config/utilities.dart';

part 'inc_exp_event.dart';
part 'inc_exp_state.dart';

class IncExpBloc extends Bloc<IncExpEvent, IncExpState> {
  IncExpBloc() : super(IncExpInitial()) {
    on<IncExpEvent>(
      (event, emit) => switch (event) {
        GetIncExpEvent() => _getIncExp(event, emit),
        AddIncExpEvent() => _addIncExp(event, emit),
        EditIncExpEvent() => _editIncExp(event, emit),
        DeleteIncExpEvent() => _deleteIncExp(event, emit),
      },
    );
  }

  _getIncExp(GetIncExpEvent event, Emitter<IncExpState> emit) async {
    await getModelss();
    emit(IncExpLoadedState(models: incexpList));
  }

  _addIncExp(AddIncExpEvent event, Emitter<IncExpState> emit) async {
    incexpList.insert(0, event.model);
    await updateModelss();
    emit(IncExpLoadedState(models: incexpList));
  }

  _editIncExp(EditIncExpEvent event, Emitter<IncExpState> emit) async {
    for (IncExp model in incexpList) {
      if (identical(model.id, event.model.id)) {
        model.amount = event.model.amount;
        model.title = event.model.title;
        model.category = event.model.category;
      }
    }
    await updateModelss();
    emit(IncExpLoadedState(models: incexpList));
  }

  _deleteIncExp(DeleteIncExpEvent event, Emitter<IncExpState> emit) async {
    incexpList.removeWhere((model) => identical(model, event.model));
    await updateModelss();
    emit(IncExpLoadedState(models: incexpList));
  }
}
