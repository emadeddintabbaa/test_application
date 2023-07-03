import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';

part 'home_state.dart';

/// Home Bloc is the state management
/// by using Bloc we can improve the performance and organize the code.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// observer for background color changing.
  BehaviorSubject<Color> colorObserver = BehaviorSubject<Color>();

  /// HomeBloc Constructor
  HomeBloc() : super(HomeState()) {
    on<ChangeBackgroundColor>(_onChangeBackgroundColor);
  }

  void _onChangeBackgroundColor(
      ChangeBackgroundColor event, Emitter<HomeState> emit,) {
    final Color newColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    /// we used rxDart to observing the new background color.
    colorObserver.sink.add(newColor);

    /// or we can use state
    emit(ColorChanged(color: newColor));
  }

  @override
  Future<void> close() {
    colorObserver.close();
    return super.close();
  }
}
