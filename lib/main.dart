import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await configureDependencies();
  runApp(const App());
}
