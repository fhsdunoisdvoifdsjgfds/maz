part of 'navbar_bloc.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}

final class NavbarStatistic extends NavbarState {}

final class NavbarLessons extends NavbarState {}

final class NavbarSettings extends NavbarState {}
