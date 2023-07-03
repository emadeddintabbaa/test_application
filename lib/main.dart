import 'package:flutter/material.dart';
import 'package:test_application/app.dart';
import 'package:test_application/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
