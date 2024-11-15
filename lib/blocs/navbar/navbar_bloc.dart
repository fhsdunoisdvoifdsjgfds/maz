import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>(
      (event, emit) => switch (event) {
        ChangePageEvent() => _change(event, emit),
      },
    );
  }

  _change(ChangePageEvent event, Emitter<NavbarState> emit) {
    if (event.index == 0 && state is! NavbarInitial) {
      emit(NavbarInitial());
    }
    if (event.index == 1 && state is! NavbarStatistic) {
      emit(NavbarStatistic());
    }
    if (event.index == 2 && state is! NavbarLessons) {
      emit(NavbarLessons());
    }
    if (event.index == 3 && state is! NavbarSettings) {
      emit(NavbarSettings());
    }
  }
}
