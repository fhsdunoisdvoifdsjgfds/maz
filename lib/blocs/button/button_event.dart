part of 'button_bloc.dart';

@immutable
sealed class ButtonEvent {}

class CheckButtonActive extends ButtonEvent {
  CheckButtonActive({required this.controllers});

  final List<String> controllers;
}
