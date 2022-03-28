import 'package:flutter/widgets.dart' show WidgetsFlutterBinding, runApp;

import 'core/app.dart';
import 'core/injections/dependencies.dart';
import 'core/injections/providers.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dependencies = AppDependencies(
    child: const AppProviders(
      child: App(),
    ),
  );
  await dependencies.init();

  runApp(dependencies);
}
