part of 'button_bloc.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitial extends ButtonState {}

final class ButtonInactive extends ButtonState {}
