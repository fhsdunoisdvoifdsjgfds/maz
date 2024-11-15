import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial()) {
    on<ButtonEvent>(
      (event, emit) => switch (event) {
        CheckButtonActive() => _checkButton(event, emit),
      },
    );
  }

  _checkButton(CheckButtonActive event, Emitter<ButtonState> emit) {
    final isEmpty = event.controllers.any((controller) => controller.isEmpty);
    emit(isEmpty ? ButtonInactive() : ButtonInitial());
  }
}
