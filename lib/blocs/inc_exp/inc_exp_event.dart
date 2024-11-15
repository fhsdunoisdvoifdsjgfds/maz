part of 'inc_exp_bloc.dart';

@immutable
sealed class IncExpEvent {}

class GetIncExpEvent extends IncExpEvent {}

class AddIncExpEvent extends IncExpEvent {
  AddIncExpEvent({required this.model});

  final IncExp model;
}

class EditIncExpEvent extends IncExpEvent {
  EditIncExpEvent({required this.model});

  final IncExp model;
}

class DeleteIncExpEvent extends IncExpEvent {
  DeleteIncExpEvent({required this.model});

  final IncExp model;
}
