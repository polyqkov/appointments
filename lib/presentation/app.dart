import 'screens/appointments_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        theme: appTheme,
        home: const AppointmentsScreenView(),
      );
}
