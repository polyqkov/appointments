import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/injector/app_injector.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  AppInjector.init();
  runApp(const App());
}
