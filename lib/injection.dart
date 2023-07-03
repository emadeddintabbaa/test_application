import 'package:get_it/get_it.dart';
import 'package:test_application/bloc/home_bloc.dart';


/// this for dependency injection
/// by using DI we can avoid passing instances by constructors of classes.
final serviceLocator = GetIt.instance;

/// we call this function on the head of application (main.dart)
/// to init all dependencies.
Future<void> init() async {
  /// Blocs
  serviceLocator.registerLazySingleton(() => HomeBloc());

}
