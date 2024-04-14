import 'package:appointments/common/injector/app_injector.dart';
import 'package:flutter/material.dart';

import 'presentation/app.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  AppInjector.init();
  runApp(const App());
}
