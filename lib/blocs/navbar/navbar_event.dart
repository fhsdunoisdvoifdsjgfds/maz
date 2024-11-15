part of 'navbar_bloc.dart';

@immutable
sealed class NavbarEvent {}

class ChangePageEvent extends NavbarEvent {
  ChangePageEvent({required this.index});

  final int index;
}
