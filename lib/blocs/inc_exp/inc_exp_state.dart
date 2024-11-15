part of 'inc_exp_bloc.dart';

@immutable
sealed class IncExpState {}

final class IncExpInitial extends IncExpState {}

final class IncExpLoadedState extends IncExpState {
  IncExpLoadedState({required this.models});

  final List<IncExp> models;
}
