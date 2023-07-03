part of 'home_bloc.dart';


///
class HomeState {}


/// we receive the new color inside widgets by this state
class ColorChanged extends HomeState {
  /// the value of new color
  final Color color;

  /// Constructor
  ColorChanged({required this.color});

}
