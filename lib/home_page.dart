import 'package:flutter/material.dart';
import 'package:test_application/bloc/home_bloc.dart';
import 'package:test_application/constants.dart';
import 'package:test_application/injection.dart';

/// Home Page
class HomePage extends StatefulWidget {
  /// Home Page constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = serviceLocator<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    /// We observe the new color value
    /// by listening to colorObserver stream.
    return StreamBuilder<Color>(
      stream: _homeBloc.colorObserver.stream,
      initialData: Theme.of(context).primaryColor,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            /// Changing Background Color by
            /// Firing ChangeBackgroundColor Function.
            _homeBloc.add(ChangeBackgroundColor());
          },
          child: Scaffold(
            backgroundColor: snapshot.data ?? Theme.of(context).primaryColor,
            appBar: AppBar(
              backgroundColor: snapshot.data,
              elevation: Constants.elevation,
              title: const Text("Test Application"),
            ),
            body: const Center(
                child: Text(
              'Hello There',
            ),),
          ),
        );
      },
    );
  }
}
